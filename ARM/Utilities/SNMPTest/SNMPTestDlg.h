// SNMPTestDlg.h : header file
//

#pragma once


// CSNMPTestDlg dialog
class CSNMPTestDlg : public CDialog
{
// Construction
public:
    CSNMPTestDlg(CWnd* pParent = NULL); // standard constructor

    void OnOutputX(int n);
    void OnInput(int val);
    void OnUpdate();
    void SendOutput();
    void SendLcd();
    void GetInput();
    BOOL ConnTarget();

// Dialog Data
    enum { IDD = IDD_SNMPTEST_DIALOG };

    BYTE    OutValue;
    BYTE    InValue;
    BOOL    Connected;

    CIPAddressCtrl m_Target;
    CButton m_Connect;
    CEdit   m_Lcd1;
    CEdit   m_Lcd2;
    CEdit   m_Out;
    CEdit   m_In;
    CButton m_Output[8];
    CButton m_Input [8];

    protected:
    virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support


// Implementation
protected:
    HICON m_hIcon;

    // Generated message map functions
    virtual BOOL OnInitDialog();
    afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
    afx_msg void OnPaint();
    afx_msg HCURSOR OnQueryDragIcon();
    afx_msg void OnTargetip(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void OnTimer(UINT nIDEvent);
    afx_msg void OnConnect();
    afx_msg void OnLcd1();
    afx_msg void OnLcd2();
    afx_msg void OnOutput();
    afx_msg void OnOutput0();
    afx_msg void OnOutput1();
    afx_msg void OnOutput2();
    afx_msg void OnOutput3();
    afx_msg void OnOutput4();
    afx_msg void OnOutput5();
    afx_msg void OnOutput6();
    afx_msg void OnOutput7();
    afx_msg void OnClose();
    DECLARE_MESSAGE_MAP()
};
