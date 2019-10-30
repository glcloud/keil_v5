// HIDClientDlg.h : header file
//

#if !defined(AFX_HIDCLIENTDLG_H__46F86935_6486_4796_90E2_45AD5EF12B7B__INCLUDED_)
#define AFX_HIDCLIENTDLG_H__46F86935_6486_4796_90E2_45AD5EF12B7B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CHIDClientDlg dialog

class CHIDClientDlg : public CDialog
{
// Construction
public:
	CHIDClientDlg(CWnd* pParent = NULL);	// standard constructor

  BOOL  Running;
  BYTE *InReport;
  BYTE *OutReport;
  BYTE *FeatureReport;
  BYTE  InValue;
  int   InReportSz;
  int   OutReportSz;
  int   FeatureReportSz;

  void RefreshDeviceList(void);
  void ClearDialog(void);
  void OnError();
  void OnInput();
  void OnOutputX(int n); 

  OUT HDEVNOTIFY hDeviceNotify; 

// Dialog Data
	//{{AFX_DATA(CHIDClientDlg)
	enum { IDD = IDD_HIDCLIENT_DIALOG };
	CComboBox	m_Device;
	CEdit   m_Out;
	CEdit   m_In;
	CButton	m_Output[8];
	CButton	m_Input [8];
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CHIDClientDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CHIDClientDlg)
	virtual BOOL OnInitDialog();
	afx_msg LRESULT OnDeviceChange(WPARAM wParam, LPARAM lParam);
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnSelchangeDevice();
	afx_msg void OnKillfocusOutput();
	afx_msg void OnOutput0();
	afx_msg void OnOutput1();
	afx_msg void OnOutput2();
	afx_msg void OnOutput3();
	afx_msg void OnOutput4();
	afx_msg void OnOutput5();
	afx_msg void OnOutput6();
	afx_msg void OnOutput7();
	afx_msg void OnClose();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_HIDCLIENTDLG_H__46F86935_6486_4796_90E2_45AD5EF12B7B__INCLUDED_)
