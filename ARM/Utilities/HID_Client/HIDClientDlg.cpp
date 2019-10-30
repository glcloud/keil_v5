// HIDClientDlg.cpp : implementation file
//

#include "stdafx.h"
#include "HIDClient.h"
#include "HIDClientDlg.h"
#include "HID.h"
#include <dbt.h>
#include <initguid.h>
#include <hidclass.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHIDClientDlg dialog

CHIDClientDlg::CHIDClientDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CHIDClientDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CHIDClientDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CHIDClientDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CHIDClientDlg)
	DDX_Control(pDX, IDC_DEVICE, m_Device);
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
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CHIDClientDlg, CDialog)
	//{{AFX_MSG_MAP(CHIDClientDlg)
	ON_WM_SYSCOMMAND()
    ON_MESSAGE(WM_DEVICECHANGE, OnDeviceChange)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
	ON_CBN_SELCHANGE(IDC_DEVICE, OnSelchangeDevice)
	ON_EN_KILLFOCUS(IDC_OUTPUT, OnKillfocusOutput)
	ON_BN_CLICKED(IDC_OUTPUT0, OnOutput0)
	ON_BN_CLICKED(IDC_OUTPUT1, OnOutput1)
	ON_BN_CLICKED(IDC_OUTPUT2, OnOutput2)
	ON_BN_CLICKED(IDC_OUTPUT3, OnOutput3)
	ON_BN_CLICKED(IDC_OUTPUT4, OnOutput4)
	ON_BN_CLICKED(IDC_OUTPUT5, OnOutput5)
	ON_BN_CLICKED(IDC_OUTPUT6, OnOutput6)
	ON_BN_CLICKED(IDC_OUTPUT7, OnOutput7)
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHIDClientDlg message handlers

BOOL CHIDClientDlg::OnInitDialog()
{
	DEV_BROADCAST_DEVICEINTERFACE NotificationFilter;

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

	// Register notification to propagate to our application 
	memset(&NotificationFilter, 0, sizeof(NotificationFilter));
	NotificationFilter.dbcc_size = sizeof(DEV_BROADCAST_DEVICEINTERFACE);
	NotificationFilter.dbcc_devicetype = DBT_DEVTYP_DEVICEINTERFACE;
	NotificationFilter.dbcc_classguid = GUID_DEVINTERFACE_HID;

	hDeviceNotify = RegisterDeviceNotification(this->m_hWnd, &NotificationFilter, DEVICE_NOTIFY_WINDOW_HANDLE);
	if (hDeviceNotify == NULL) {
		// If registration was not successful
	}

  Running       = FALSE;

  InReport      = NULL;
  OutReport     = NULL;
  FeatureReport = NULL;

  HID_Init();
  RefreshDeviceList();
  ClearDialog();
  
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CHIDClientDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

afx_msg LRESULT CHIDClientDlg::OnDeviceChange(WPARAM wParam, LPARAM lParam)
{
  if ((wParam == DBT_DEVICEARRIVAL) || (wParam == DBT_DEVICEREMOVECOMPLETE)) {
    RefreshDeviceList();
    m_Device.SetCurSel(HID_GetSelectedDevice() + 1);
  }
  return TRUE;
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CHIDClientDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

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

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CHIDClientDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CHIDClientDlg::RefreshDeviceList(void) 
{
  char  buf[256];
  int   n, i;

  n = HID_FindDevices();
  m_Device.ResetContent();
  m_Device.AddString("<None>");
  for (i = 0; i < n; i++) {
    if (!HID_GetName(i, buf, sizeof(buf))) {
      sprintf(buf, "Device %d", i);
    }
    m_Device.AddString(buf);
  }
}

void CHIDClientDlg::ClearDialog(void) 
{
  int  n;

  m_Device.SetFocus();
  m_Device.SetCurSel(0);
  m_Out.EnableWindow(FALSE);
  m_Out.SetWindowText("");
  m_In.SetWindowText("");
  for (n = 0; n < 8; n++) {
    m_Output[n].SetCheck(0);
    m_Output[n].EnableWindow(FALSE);
    m_Input [n].SetCheck(0);
    m_Input [n].EnableWindow(FALSE);
  }
}

void CHIDClientDlg::OnError() 
{
  Running = FALSE;
  KillTimer(1);
  HID_Close();
  ClearDialog();
}

void CHIDClientDlg::OnTimer(UINT nIDEvent) 
{
  DWORD cnt;

  if (Running) {
    if (HID_Read(InReport, InReportSz, &cnt)) {
      if (cnt)
        OnInput();
    } else {
      OnError();
    }
  }
  
	CDialog::OnTimer(nIDEvent);
}

void CHIDClientDlg::OnSelchangeDevice() 
{
  DWORD cnt;
  int   n;

  if (Running) {
    Running = FALSE;
    KillTimer(1);
    HID_Close();
  }

  m_Out.SetWindowText("");
  m_In.SetWindowText("");
  for (n = 0; n < 8; n++) {
    m_Output[n].SetCheck(0);
    m_Input [n].SetCheck(0);
  }

  n = m_Device.GetCurSel();
  if (n > 0) {
    if (HID_Open(n-1)) {
      InReportSz       = HID_GetInputReportSize(n-1);
      OutReportSz      = HID_GetOutputReportSize(n-1);
      FeatureReportSz  = HID_GetFeatureReportSize(n-1);
      if (InReport)      free(InReport);
      if (OutReport)     free(OutReport);
      if (FeatureReport) free(FeatureReport);
      InReport         = (BYTE *)calloc(InReportSz, 1);
      OutReport        = (BYTE *)calloc(OutReportSz, 1);
      FeatureReport    = (BYTE *)calloc(FeatureReportSz, 1);
      Running          = TRUE;
      InValue          = 0;
      m_Out.SetWindowText("0x00");
      m_In.SetWindowText("0x00");
      SetTimer(1, 20, NULL);
//    FeatureReport[1] = 0x55;
//    if (!HID_SetFeature(FeatureReport, FeatureReportSz)) {
//      OnError();
//      return;
//    }
//    if (!HID_GetFeature(FeatureReport, FeatureReportSz)) {
//      OnError();
//      return;
//    }
      OutReport[1] = 0;
      if (!HID_Write(OutReport, OutReportSz, &cnt)) {
        OnError();
        return;
      }
      if (!HID_Read(InReport, InReportSz, &cnt)) {
        OnError();
        return;
      }
      if (cnt)
        OnInput();
    }
  }

  m_Out.EnableWindow(Running);
  for (n = 0; n < 8; n++) {
    m_Output[n].EnableWindow(Running);
    m_Input [n].EnableWindow(Running);
  }
}

void CHIDClientDlg::OnKillfocusOutput() 
{
  DWORD cnt;
  int   val;
  int   n;
  char  buf[8];

  n = m_Out.GetWindowText(buf, sizeof(buf));
  buf[n] = 0;
  n = sscanf(buf, "%i", &val);
  if (n == 1) {
    if ((val >= 0) && (val <= 255)) {
      OutReport[1] = (BYTE)val;
      for (n = 0; n < 8; n++) {
        m_Output[n].SetCheck((val & (1 << n)) ? 1 : 0);
      }
      if (!HID_Write(OutReport, OutReportSz, &cnt)) {
        OnError();
        return;
      }
    }
  }
  sprintf(buf, "0x%02X", OutReport[1]);
  m_Out.SetWindowText(buf);
}

void CHIDClientDlg::OnInput()
{
  int  n;
  char buf[8];

  if (InValue == InReport[1]) return;

  InValue = InReport[1];

  for (n = 0; n < 8; n++) {
    m_Input[n].SetCheck((InValue & (1 << n)) ? 1 : 0);
  }
  sprintf(buf, "0x%02X", InValue);
  m_In.SetWindowText(buf);
}

void CHIDClientDlg::OnOutputX(int n) 
{
  DWORD cnt;
  char  buf[8];

  if (m_Output[n].GetCheck()) {
    OutReport[1] |=  (1 << n);
  } else {
    OutReport[1] &= ~(1 << n);
  }
  sprintf(buf, "0x%02X", OutReport[1]);
  m_Out.SetWindowText(buf);

  if (!HID_Write(OutReport, OutReportSz, &cnt)) {
    OnError();
  }
}

void CHIDClientDlg::OnOutput0() 
{
  OnOutputX(0);
}

void CHIDClientDlg::OnOutput1() 
{
  OnOutputX(1);
}

void CHIDClientDlg::OnOutput2() 
{
  OnOutputX(2);
}

void CHIDClientDlg::OnOutput3() 
{
  OnOutputX(3);
}

void CHIDClientDlg::OnOutput4() 
{
  OnOutputX(4);
}

void CHIDClientDlg::OnOutput5() 
{
  OnOutputX(5);
}

void CHIDClientDlg::OnOutput6() 
{
  OnOutputX(6);
}

void CHIDClientDlg::OnOutput7() 
{
  OnOutputX(7);
}

void CHIDClientDlg::OnClose() 
{
  UnregisterDeviceNotification(hDeviceNotify);
  if (Running) {
    Running = FALSE;
    KillTimer(1);
    HID_Close();
  }
  if (InReport)      free(InReport);
  if (OutReport)     free(OutReport);
  if (FeatureReport) free(FeatureReport);

	HID_UnInit();

	CDialog::OnClose();
}

void CHIDClientDlg::OnOK() 
{
  // do nothing
}
