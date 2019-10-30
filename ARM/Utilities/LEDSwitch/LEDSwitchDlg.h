// LEDSwitchDlg.h : header file
//

#pragma once


// CLEDSwitchDlg dialog
class CLEDSwitchDlg : public CDialog
{
// Construction
public:
	CLEDSwitchDlg(CWnd* pParent = NULL);	// standard constructor
    void OnOutpX(int n);
    void OnUpdate();
    void OnSend();

// Dialog Data
	enum { IDD = IDD_LEDSWITCH_DIALOG };
    BYTE    OutValue;
    CIPAddressCtrl m_Target;
	CEdit   m_Target6;
    CButton m_Tcp;
    CButton m_Udp;
    CEdit   m_Out;
    CEdit   m_Port;
	CButton m_Ip4;
	CButton m_Ip6;
    CButton m_Outp[8];

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
    afx_msg void OnTcp();
    afx_msg void OnUdp();
	afx_msg void OnIp4();
	afx_msg void OnIp6();
	afx_msg void OnTargetip(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnTargetip6();
	afx_msg void OnPort();
    afx_msg void OnOut();
    afx_msg void OnOut0();
    afx_msg void OnOut1();
    afx_msg void OnOut2();
    afx_msg void OnOut3();
    afx_msg void OnOut4();
    afx_msg void OnOut5();
    afx_msg void OnOut6();
    afx_msg void OnOut7();
public:
};
