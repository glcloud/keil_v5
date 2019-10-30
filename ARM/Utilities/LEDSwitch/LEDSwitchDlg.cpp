// LEDSwitchDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LEDSwitch.h"
#include "LEDSwitchDlg.h"
#include "Ws2tcpip.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define DEF_PORT        1001
#define DEF_IP          _T("192.168.0.100")
#define DEF_IP6         _T("fe80::1c30:6cff:fea2:455e")
#define BLINKLED        0x01 

IN_ADDR  Target_IP;
IN6_ADDR Target_IP6;
static int Port;
static bool UseTcp;
static bool UseIp6;

static CString WSTITLE  = _T("Ethernet Connection Error");
static CString WSERROR1 = _T("Failed to start Winsocket Connection.\nPlease check the settings of your network interface card!");
static CString WSERROR2 = _T("Couldn't get a socket.\nPlease check the TCP/IP settings of your PC!");
static CString WSERROR3 = _T("Couldn't connect.\nPlease check TCP/IP settings of your PC!");
static CString WSERROR4 = _T("Couldn't send complete data!");

// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CLEDSwitchDlg dialog




CLEDSwitchDlg::CLEDSwitchDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLEDSwitchDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLEDSwitchDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
    DDX_Control(pDX, IDC_TARGETIP, m_Target);
    DDX_Control(pDX, IDC_TARGETIP6, m_Target6);
    DDX_Control(pDX, IDC_TCP, m_Tcp);
    DDX_Control(pDX, IDC_UDP, m_Udp);
	DDX_Control(pDX, IDC_PORT, m_Port);
	DDX_Control(pDX, IDC_IP4, m_Ip4);
	DDX_Control(pDX, IDC_IP6, m_Ip6);
    DDX_Control(pDX, IDC_OUT, m_Out);
    DDX_Control(pDX, IDC_OUT0, m_Outp[0]);
    DDX_Control(pDX, IDC_OUT1, m_Outp[1]);
    DDX_Control(pDX, IDC_OUT2, m_Outp[2]);
    DDX_Control(pDX, IDC_OUT3, m_Outp[3]);
    DDX_Control(pDX, IDC_OUT4, m_Outp[4]);
    DDX_Control(pDX, IDC_OUT5, m_Outp[5]);
    DDX_Control(pDX, IDC_OUT6, m_Outp[6]);
    DDX_Control(pDX, IDC_OUT7, m_Outp[7]);
}

BEGIN_MESSAGE_MAP(CLEDSwitchDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
    ON_BN_CLICKED(IDC_TCP, OnTcp)
    ON_BN_CLICKED(IDC_UDP, OnUdp)
	ON_BN_CLICKED(IDC_IP4, OnIp4)
	ON_BN_CLICKED(IDC_IP6, OnIp6)
    ON_NOTIFY(IPN_FIELDCHANGED, IDC_TARGETIP, OnTargetip)
	ON_EN_KILLFOCUS(IDC_TARGETIP6, OnTargetip6)
	ON_EN_KILLFOCUS(IDC_PORT, OnPort)
    ON_EN_KILLFOCUS(IDC_OUT, OnOut)
	ON_BN_CLICKED(IDC_OUT0, OnOut0)
    ON_BN_CLICKED(IDC_OUT1, OnOut1)
    ON_BN_CLICKED(IDC_OUT2, OnOut2)
    ON_BN_CLICKED(IDC_OUT3, OnOut3)
    ON_BN_CLICKED(IDC_OUT4, OnOut4)
    ON_BN_CLICKED(IDC_OUT5, OnOut5)
    ON_BN_CLICKED(IDC_OUT6, OnOut6)
    ON_BN_CLICKED(IDC_OUT7, OnOut7)
END_MESSAGE_MAP()


// CLEDSwitchDlg message handlers

BOOL CLEDSwitchDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here
    OutValue = 0x00;
    Port     = DEF_PORT;
    UseTcp   = FALSE;
	UseIp6   = FALSE;

    InetPton (AF_INET,  DEF_IP,  &Target_IP);
	InetPton (AF_INET6, DEF_IP6, &Target_IP6);
    m_Target.SetAddress(Target_IP.S_un.S_un_b.s_b1,
                        Target_IP.S_un.S_un_b.s_b2, 
                        Target_IP.S_un.S_un_b.s_b3, 
                        Target_IP.S_un.S_un_b.s_b4);

	m_Target6.SetLimitText (40);
    m_Target6.SetWindowText (DEF_IP6);
	SetDlgItemInt(IDC_PORT,Port,FALSE);
	m_Tcp.SetCheck(FALSE);
    m_Udp.SetCheck(TRUE);
	m_Ip4.SetCheck(TRUE);
	m_Ip6.SetCheck(FALSE);
    OnUpdate ();

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CLEDSwitchDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CLEDSwitchDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CLEDSwitchDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CLEDSwitchDlg::OnTcp() {
  UseTcp = TRUE;
}

void CLEDSwitchDlg::OnUdp() {
  UseTcp = FALSE;
}

void CLEDSwitchDlg::OnIp4() {
  UseIp6 = FALSE;
  OnUpdate ();
}

void CLEDSwitchDlg::OnIp6() {
  UseIp6 = TRUE;
  OnUpdate ();
}

void CLEDSwitchDlg::OnTargetip(NMHDR *pNMHDR, LRESULT *pResult) {
  LPNMIPADDRESS pIPAddr = reinterpret_cast<LPNMIPADDRESS>(pNMHDR);

  switch(pIPAddr->iField) {
    case 0: Target_IP.S_un.S_un_b.s_b1 = pIPAddr->iValue;
            break;
    case 1: Target_IP.S_un.S_un_b.s_b2 = pIPAddr->iValue;
            break;
    case 2: Target_IP.S_un.S_un_b.s_b3 = pIPAddr->iValue;
            break;
    case 3: Target_IP.S_un.S_un_b.s_b4 = pIPAddr->iValue;
            break;
    default:
            break;
  }
  *pResult = 0;
}

void CLEDSwitchDlg::OnTargetip6() {
  IN6_ADDR tmp_ip6;
  TCHAR tbuf[40];

  m_Target6.GetWindowText ((LPTSTR)tbuf, sizeof(tbuf));
  if (InetPton (AF_INET6, tbuf, &tmp_ip6)) {
    Target_IP6 = tmp_ip6;
  }
  InetNtop(AF_INET6, &Target_IP6, tbuf, 40);
  m_Target6.SetWindowText ((CString)tbuf);
}

void CLEDSwitchDlg::OnUpdate() {
  char  buf[8];
  int   n;

  for (n = 0; n < 8; n++) {
    m_Outp[n].SetCheck((OutValue>>n) & 1);
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  m_Target.EnableWindow (!UseIp6);
  m_Target6.EnableWindow(UseIp6);
}

void CLEDSwitchDlg::OnPort() {
  BOOL Trans;
  int val;

  val = GetDlgItemInt (IDC_PORT, &Trans, FALSE);
  if ((Trans == FALSE) || (val == 0) || (val > 65535)) {
    SetDlgItemInt (IDC_PORT, Port, FALSE);
  }
  else {
    Port = val;
  }
}

void CLEDSwitchDlg::OnSend() {
  struct sockaddr_in  sin;
  struct sockaddr_in6 sin6;
  struct timeval tv;
  WSADATA wsaData;
  SOCKADDR *saddr;
  int saddr_len;
  SOCKET  s;
  DWORD retval;
  char buf[16];

  if (WSAStartup(0x101,&wsaData)) {
    MessageBox(WSERROR1, WSTITLE, MB_OK | MB_ICONSTOP); 
    WSACleanup();
    return;
  }

  sin.sin_family     = AF_INET; 
  sin.sin_addr       = Target_IP;
  sin.sin_port       = htons(Port);

  sin6.sin6_family   = AF_INET6;
  sin6.sin6_addr     = Target_IP6;
  sin6.sin6_port     = htons(Port);
  sin6.sin6_flowinfo = 0;
  sin6.sin6_scope_id = 0;

  s = socket(UseIp6 ? AF_INET6    : AF_INET,
	         UseTcp ? SOCK_STREAM : SOCK_DGRAM, 0);  // SOCK_DGRAM means UDP!

  if(s == INVALID_SOCKET) {
    MessageBox(WSERROR2, WSTITLE, MB_OK | MB_ICONSTOP); 
    WSACleanup();
    return;
  }
 
  saddr     = UseIp6 ? (SOCKADDR *)&sin6 : (SOCKADDR *)&sin;
  saddr_len = UseIp6 ? sizeof (sin6)     : sizeof (sin); 
  if (connect (s, saddr, saddr_len) == SOCKET_ERROR) {
    MessageBox(WSERROR3,WSTITLE, MB_OK | MB_ICONSTOP); 
    WSACleanup();
    return;
  }
  tv.tv_sec = 3;
  tv.tv_usec= 0;
  if (setsockopt (s, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv, sizeof(tv))) {
    MessageBox(WSERROR1, WSTITLE, MB_OK | MB_ICONSTOP); 
    closesocket(s);
    WSACleanup();
    return;
  }
  buf[0] = BLINKLED;
  buf[1] = OutValue;

  retval = send(s, buf, 2, 0);
  if (retval != 2) {
    MessageBox(WSERROR4, WSTITLE, MB_OK | MB_ICONSTOP); 
  }

  closesocket(s);
  WSACleanup(); 
}

void CLEDSwitchDlg::OnOut() {
  char  buf[20];
  int   i,val,n;

  n = m_Out.GetWindowText((LPTSTR)buf, sizeof(buf));
  for (i = 0; i < 10; i++) {
    buf[i] = buf[2*i];
  }
  buf[n] = 0;
  n = sscanf(buf, "%d", &val);
  if (n == 1) {
    if ((val >= 0) && (val <= 255)) {
      OutValue = (BYTE)val;
      for (n = 0; n < 8; n++) {
        m_Outp[n].SetCheck((val >> n) & 1);
      }
    }
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  OnSend();
}

void CLEDSwitchDlg::OnOutpX(int n) {
  char  buf[8];

  if (m_Outp[n].GetCheck()) {
    OutValue |=  (1 << n);
  }
  else {
    OutValue &= ~(1 << n);
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  OnSend();
}

void CLEDSwitchDlg::OnOut0() {
  OnOutpX (0);
}

void CLEDSwitchDlg::OnOut1() {
  OnOutpX (1);
}

void CLEDSwitchDlg::OnOut2() {
  OnOutpX (2);
}

void CLEDSwitchDlg::OnOut3() {
  OnOutpX (3);
}

void CLEDSwitchDlg::OnOut4() {
  OnOutpX (4);
}

void CLEDSwitchDlg::OnOut5() {
  OnOutpX (5);
}

void CLEDSwitchDlg::OnOut6() {
  OnOutpX (6);
}

void CLEDSwitchDlg::OnOut7() {
  OnOutpX (7);
}

