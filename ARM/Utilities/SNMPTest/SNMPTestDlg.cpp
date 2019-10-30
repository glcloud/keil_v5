// SNMPTestDlg.cpp : implementation file
//

#include "stdafx.h"
#include "SNMPTest.h"
#include "SNMPTestDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define SNMP_PORT       161
#define DEF_IP          "192.168.0.100"
#define DEF_LCD1        "SNMP Tester"
#define DEF_LCD2        "for RL-ARM"

IN_ADDR Target_IP;
static int UDPPort;
static SOCKET soc;

static CString WSTITLE  = _T("Ethernet Connection Error");
static CString WSERROR1 = _T("Failed to start Winsocket Connection.\nPlease check the settings of your network interface card!");
static CString WSERROR2 = _T("Couldn't get a socket.\nPlease check the TCP/IP settings of your PC!");
static CString WSERROR3 = _T("Couldn't connect.\nPlease check TCP/IP settings of your PC!");
static CString WSERROR4 = _T("Couldn't send complete data!");
static CString WSERROR5 = _T("Failed to connect to Target.\nPlease check Target IP Address!");
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


// CSNMPTestDlg dialog




CSNMPTestDlg::CSNMPTestDlg(CWnd* pParent /*=NULL*/)
    : CDialog(CSNMPTestDlg::IDD, pParent)
{
    m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSNMPTestDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    DDX_Control(pDX, IDC_TARGETIP, m_Target);
    DDX_Control(pDX, IDC_CONNECT, m_Connect);
    DDX_Control(pDX, IDC_LCD1, m_Lcd1);
    DDX_Control(pDX, IDC_LCD2, m_Lcd2);
    DDX_Control(pDX, IDC_OUTPUT, m_Out);
    DDX_Control(pDX, IDC_OUTPUT0, m_Output[0]);
    DDX_Control(pDX, IDC_OUTPUT1, m_Output[1]);
    DDX_Control(pDX, IDC_OUTPUT2, m_Output[2]);
    DDX_Control(pDX, IDC_OUTPUT3, m_Output[3]);
    DDX_Control(pDX, IDC_OUTPUT4, m_Output[4]);
    DDX_Control(pDX, IDC_OUTPUT5, m_Output[5]);
    DDX_Control(pDX, IDC_OUTPUT6, m_Output[6]);
    DDX_Control(pDX, IDC_OUTPUT7, m_Output[7]);
    DDX_Control(pDX, IDC_INPUT, m_In);
    DDX_Control(pDX, IDC_INPUT0, m_Input[0]);
    DDX_Control(pDX, IDC_INPUT1, m_Input[1]);
    DDX_Control(pDX, IDC_INPUT2, m_Input[2]);
    DDX_Control(pDX, IDC_INPUT3, m_Input[3]);
    DDX_Control(pDX, IDC_INPUT4, m_Input[4]);
    DDX_Control(pDX, IDC_INPUT5, m_Input[5]);
    DDX_Control(pDX, IDC_INPUT6, m_Input[6]);
    DDX_Control(pDX, IDC_INPUT7, m_Input[7]);
}

BEGIN_MESSAGE_MAP(CSNMPTestDlg, CDialog)
    ON_WM_SYSCOMMAND()
    ON_WM_PAINT()
    ON_WM_QUERYDRAGICON()
    ON_WM_TIMER()
    ON_NOTIFY(IPN_FIELDCHANGED, IDC_TARGETIP, OnTargetip)
    ON_EN_KILLFOCUS(IDC_LCD1, OnLcd1)
    ON_EN_KILLFOCUS(IDC_LCD2, OnLcd2)
    ON_EN_KILLFOCUS(IDC_OUTPUT, OnOutput)
    ON_BN_CLICKED(IDC_CONNECT, OnConnect)
    ON_BN_CLICKED(IDC_OUTPUT0, OnOutput0)
    ON_BN_CLICKED(IDC_OUTPUT1, OnOutput1)
    ON_BN_CLICKED(IDC_OUTPUT2, OnOutput2)
    ON_BN_CLICKED(IDC_OUTPUT3, OnOutput3)
    ON_BN_CLICKED(IDC_OUTPUT4, OnOutput4)
    ON_BN_CLICKED(IDC_OUTPUT5, OnOutput5)
    ON_BN_CLICKED(IDC_OUTPUT6, OnOutput6)
    ON_BN_CLICKED(IDC_OUTPUT7, OnOutput7)
END_MESSAGE_MAP()


// CSNMPTestDlg message handlers

BOOL CSNMPTestDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    int   n;

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
    SetIcon(m_hIcon, TRUE);         // Set big icon
    SetIcon(m_hIcon, FALSE);        // Set small icon

    // TODO: Add extra initialization here
    UDPPort  = SNMP_PORT;

    Target_IP.S_un.S_addr = inet_addr(DEF_IP);
    m_Target.SetAddress(Target_IP.S_un.S_un_b.s_b1, 
                        Target_IP.S_un.S_un_b.s_b2, 
                        Target_IP.S_un.S_un_b.s_b3, 
                        Target_IP.S_un.S_un_b.s_b4);
    m_Lcd1.SetLimitText (16);
    m_Lcd2.SetLimitText (16);
    m_Lcd1.SetWindowText(_T(DEF_LCD1));
    m_Lcd2.SetWindowText(_T(DEF_LCD2));
    for (n = 0; n < 8; n++) {
      m_Input [n].EnableWindow(FALSE);
    }

    InValue  = 0x00;
    OutValue = 0x00;
    Connected = FALSE;
    OnUpdate ();

    return TRUE;  // return TRUE  unless you set the focus to a control
}

void CSNMPTestDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CSNMPTestDlg::OnPaint()
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
HCURSOR CSNMPTestDlg::OnQueryDragIcon() {
  return static_cast<HCURSOR>(m_hIcon);
}

void CSNMPTestDlg::OnTargetip(NMHDR *pNMHDR, LRESULT *pResult) {
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

void CSNMPTestDlg::OnUpdate() {
  char  buf[8];
  int   n;

  m_Target.EnableWindow(!Connected);
  m_Connect.SetWindowText(Connected ? _T("Disconn.") : _T("Connect"));
  m_Lcd1.EnableWindow(Connected);
  m_Lcd2.EnableWindow(Connected);
  m_Out.EnableWindow(Connected);
  m_In.EnableWindow(Connected);
  for (n = 0; n < 8; n++) {
    m_Output[n].EnableWindow(Connected);
    m_Output[n].SetCheck((OutValue>>n) & 1);
    m_Input[n].SetCheck((InValue>>n) & 1);
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  sprintf(buf, "0x%02X", InValue);
  m_In.SetWindowText((CString)buf);
}


void CSNMPTestDlg::OnInput(int val) {
  char buf[8];
  int  n;

  if (InValue == val) return;
  InValue = val;

  for (n = 0; n < 8; n++) {
    m_Input[n].SetCheck((InValue >> n) & 1);
  }
  sprintf(buf, "0x%02X", InValue);
  m_In.SetWindowText((CString)buf);
}


void CSNMPTestDlg::OnTimer(UINT nIDEvent) {
  GetInput(); 
  CDialog::OnTimer(nIDEvent);
}

void CSNMPTestDlg::OnConnect() {
  struct sockaddr_in sin;
  struct timeval tv;
  WSADATA wsaData;

  if (Connected) {
    KillTimer(1);
    closesocket(soc);
    WSACleanup();
    Connected = FALSE;
    OnUpdate();
  }     
  else {
    /* Open an UDP socket. */
    if (WSAStartup(0x101,&wsaData)) {
      MessageBox(WSERROR1, WSTITLE, MB_OK | MB_ICONSTOP); 
      WSACleanup();
      return;
    }
    sin.sin_addr   = Target_IP;
    sin.sin_family = AF_INET; 
    sin.sin_port   = htons(UDPPort);
    soc = socket(AF_INET,SOCK_DGRAM,0);
    if(soc == INVALID_SOCKET) {
      MessageBox(WSERROR2,WSTITLE, MB_OK | MB_ICONSTOP); 
      WSACleanup();
      return;
    }
    if(connect(soc,(struct sockaddr*)&sin,sizeof(sin)) == SOCKET_ERROR) {
      MessageBox(WSERROR3, WSTITLE, MB_OK | MB_ICONSTOP); 
      WSACleanup();
      return;
    }
    tv.tv_sec = 3;
    tv.tv_usec= 0;
    if (setsockopt (soc, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv, sizeof(tv))) {
      MessageBox(WSERROR1, WSTITLE, MB_OK | MB_ICONSTOP); 
      WSACleanup();
      return;
    }
    if (ConnTarget() == FALSE) {
      MessageBox(WSERROR5, WSTITLE, MB_OK | MB_ICONSTOP); 
      WSACleanup();
      return;
    }
    SendOutput();
    SendLcd();
    SetTimer(1, 300, NULL);
    Connected = TRUE;
    OnUpdate();
  }
}

void CSNMPTestDlg::OnClose() {
  if (Connected) {
    KillTimer(1);
    closesocket(soc);
    WSACleanup();
    Connected = FALSE;
  }
  CDialog::OnClose();
}

BOOL CSNMPTestDlg::ConnTarget() {
  /* Get Variable command for System MIB - SysDescr Entry. */
  /* Community= 'public', OID=1.3.6.1.2.1.1.1.0 */
  BYTE GetSysDesc[40] = {
    0x30,0x26,0x02,0x01,0x00,0x04,0x06,0x70,0x75,0x62,
    0x6C,0x69,0x63,0xA0,0x19,0x02,0x01,0x00,0x02,0x01,
    0x00,0x02,0x01,0x00,0x30,0x0E,0x30,0x0C,0x06,0x08,
    0x2B,0x06,0x01,0x02,0x01,0x01,0x01,0x00,0x04,0x00};
  char buf[256];
  int n,len;

  len = sizeof(GetSysDesc);
  n = send(soc,(char *)GetSysDesc,len,0);
  /* read a reply. */
  n = recv(soc,buf,sizeof(buf),0);
  if (n == SOCKET_ERROR) {
    n = WSAGetLastError();
    return (FALSE);
  }
  return (TRUE);
}

void CSNMPTestDlg::SendOutput() {
  /* Set Variable command for Experimental MIB - LedOut Entry. */
  /* Community= 'public', OID=1.3.6.1.3.1.0 */
  BYTE SetLed[39] = {
    0x30,0x25,0x02,0x01,0x00,0x04,0x06,0x70,0x75,0x62,
    0x6C,0x69,0x63,0xA3,0x18,0x02,0x01,0x00,0x02,0x01,
    0x00,0x02,0x01,0x00,0x30,0x0D,0x30,0x0B,0x06,0x06,
    0x2B,0x06,0x01,0x03,0x01,0x00,0x02,0x01,0x00};
  char buf[64];
  int n,len;

  SetLed[38] = OutValue;
  len = sizeof(SetLed);
  n = send(soc,(char *)SetLed,len,0);
  if (n != len) {
    MessageBox(WSERROR4, WSTITLE, MB_OK | MB_ICONSTOP); 
  }
  /* Dummy read a reply. */
  n = recv(soc,buf,sizeof(buf),0);
  if (n == SOCKET_ERROR) {
    n = WSAGetLastError();
  }
}

void CSNMPTestDlg::SendLcd() {
  /* Set Variable command for Experimental MIB - LCD1 and LCD2Entry. */
  /* Community= 'public', OID1=1.3.6.1.3.3.0, OID2=1.3.6.1.3.4.0 */
  BYTE SetLcd[82] = {
    0x30,0x50,0x02,0x01,0x00,0x04,0x06,0x70,0x75,0x62,
    0x6C,0x69,0x63,0xA3,0x43,0x02,0x01,0x00,0x02,0x01,
    0x00,0x02,0x01,0x00,0x30,0x38,0x30,0x1A,0x06,0x06,
    0x2B,0x06,0x01,0x03,0x03,0x00,0x04,0x10,0x20,0x20,
    0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,
    0x20,0x20,0x20,0x20,0x30,0x1A,0x06,0x06,0x2B,0x06,
    0x01,0x03,0x04,0x00,0x04,0x10,0x20,0x20,0x20,0x20,
    0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,
    0x20,0x20};
  char buf[128];
  int n,len;

  len = m_Lcd1.GetWindowText((LPTSTR)buf, sizeof(buf));
  for (n = 0; n < len; n++) {
    SetLcd[38+n] = buf[2*n];
  }
  len = m_Lcd2.GetWindowText((LPTSTR)buf, sizeof(buf));
  for (n = 0; n < len; n++) {
    SetLcd[66+n] = buf[2*n];
  }
  len = sizeof(SetLcd);
  n = send(soc,(char *)SetLcd,len,0);
  if (n != len) {
    MessageBox(WSERROR4, WSTITLE, MB_OK | MB_ICONSTOP); 
  }
  /* Dummy read a reply. */
  n = recv(soc,buf,sizeof(buf),0);
  if (n == SOCKET_ERROR) {
    n = WSAGetLastError();
  }
}

void CSNMPTestDlg::GetInput() {
  /* Get Variable command for Experimental MIB - KeyIn Entry. */
  /* Community= 'public', OID=1.3.6.1.3.2.0 */
  BYTE GetKey[38] = {
    0x30,0x24,0x02,0x01,0x00,0x04,0x06,0x70,0x75,0x62,
    0x6C,0x69,0x63,0xA0,0x17,0x02,0x01,0x00,0x02,0x01,
    0x00,0x02,0x01,0x00,0x30,0x0C,0x30,0x0A,0x06,0x06,
    0x2B,0x06,0x01,0x03,0x02,0x00,0x02,0x00};
  char buf[64];
  int n,len;

  len = sizeof(GetKey);
  n = send(soc,(char *)GetKey,len,0);
  if (n != len) {
    MessageBox(WSERROR4, WSTITLE, MB_OK | MB_ICONSTOP); 
  }
  /* Read a reply. */
  n = recv(soc,buf,sizeof(buf),0);
  if (n == SOCKET_ERROR) {
    n = WSAGetLastError();
  }
  OnInput (buf[38]);
}

void CSNMPTestDlg::OnLcd1() {
  SendLcd();
}

void CSNMPTestDlg::OnLcd2() {
  SendLcd();
}

void CSNMPTestDlg::OnOutput() {
  char  buf[20];
  int   val,n;

  n = m_Out.GetWindowText((LPTSTR)buf, sizeof(buf));
  buf[n] = 0;
  n = sscanf(buf, "%i", &val);
  if (n == 1) {
    if ((val >= 0) && (val <= 255)) {
      OutValue = (BYTE)val;
      for (n = 0; n < 8; n++) {
        m_Output[n].SetCheck((val >> n) & 1);
      }
    }
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  SendOutput();
}

void CSNMPTestDlg::OnOutputX(int n) {
  char  buf[8];

  if (m_Output[n].GetCheck()) {
    OutValue |=  (1 << n);
  }
  else {
    OutValue &= ~(1 << n);
  }
  sprintf(buf, "0x%02X", OutValue);
  m_Out.SetWindowText((CString)buf);
  SendOutput();
}


void CSNMPTestDlg::OnOutput0() {
  OnOutputX (0);
}

void CSNMPTestDlg::OnOutput1() {
  OnOutputX (1);
}

void CSNMPTestDlg::OnOutput2() {
  OnOutputX (2);
}

void CSNMPTestDlg::OnOutput3() {
  OnOutputX (3);
}

void CSNMPTestDlg::OnOutput4() {
  OnOutputX (4);
}

void CSNMPTestDlg::OnOutput5() {
  OnOutputX (5);
}

void CSNMPTestDlg::OnOutput6() {
  OnOutputX (6);
}

void CSNMPTestDlg::OnOutput7() {
  OnOutputX (7);
}

