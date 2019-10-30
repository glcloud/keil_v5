
#include "stdafx.h"

extern "C" 
{
#include "setupapi.h" 
#include "hidsdi.h"
}

#include "HID.h"


#define DEV_NUM  10

int                                DevCount;
int                                DevSelected;
PSP_DEVICE_INTERFACE_DETAIL_DATA   DevDetailData[DEV_NUM];
int                                DevDetailDataSz[DEV_NUM];
int                                DevInputReportSz[DEV_NUM];
int                                DevOutputReportSz[DEV_NUM];
int                                DevFeatureReportSz[DEV_NUM];
HANDLE                             DevHandle;
OVERLAPPED                         DevOverlapped;
BOOL                               DevReadPending;


/*
 *  HID Initialization
 *    Parameters:      None
 *    Return Value:    None
 */

void HID_Init() {
  int  i;

  DevCount = 0;

  DevSelected = -1;
  for (i = 0; i < DEV_NUM; i++) {
    DevDetailData[i] = NULL;
  }
}


/*
 *  HID Uninitialization
 *    Parameters:      None
 *    Return Value:    None
 */

void HID_UnInit() {
  int  i;

  for (i = 0; i < DEV_NUM; i++) {
    if (DevDetailData[i]) free(DevDetailData[i]);
  }
}


/*
 *  HID Find Devices
 *    Parameters:      None
 *    Return Value:    Number of Devices found
 */

int HID_FindDevices() {
  GUID                             HidGuid;
  HANDLE                           DevHandle;
  HDEVINFO                         DevInfo;
  SP_DEVICE_INTERFACE_DATA         DevData;
  PSP_DEVICE_INTERFACE_DETAIL_DATA DevDetail;
  PSP_DEVICE_INTERFACE_DETAIL_DATA DevDetailSelected;
  PHIDP_PREPARSED_DATA	           PreparsedData;
  HIDP_CAPS	                       Capabilities;
  ULONG                            Length;
  int                              Index;
  int                              Sz;
  BOOL                             ok;

  /* Get GUID for all System HIDs */
  HidD_GetHidGuid(&HidGuid);

  /* Get Device Information for all present devices */
  DevInfo = SetupDiGetClassDevs(&HidGuid, 
                                NULL, 
                                NULL, 
                                (DIGCF_PRESENT | DIGCF_DEVICEINTERFACE)
                                );

  DevData.cbSize = sizeof(DevData);

  DevDetail = NULL;
  if (DevSelected != -1) {
    // Copy selected device data so we can find it in new list
    DevDetailSelected = (PSP_DEVICE_INTERFACE_DETAIL_DATA) malloc(DevDetailDataSz[DevSelected]);
    memcpy(DevDetailSelected, DevDetailData[DevSelected], DevDetailDataSz[DevSelected]);
  } else {
    DevDetailSelected = NULL;
  }

  for (Index = 0; Index < DEV_NUM; Index++) {
    if (DevDetailData[Index]) {
	  free(DevDetailData[Index]);
	  DevDetailData[Index] = NULL;
	}
  }

  Index = -1;

  /* Scan all Devices */
  DevCount = 0;
  do {

    Index++;

    /* Device Interface Element of a Device Information set */
    ok = SetupDiEnumDeviceInterfaces(DevInfo, 
                                     0, 
                                     &HidGuid, 
                                     Index, 
                                     &DevData
                                     );
    if (!ok) break;

    /* Get Device Interface Details - Get Length */
    ok = SetupDiGetDeviceInterfaceDetail(DevInfo, 
                                         &DevData, 
                                         NULL, 
                                         0, 
                                         &Length, 
                                         NULL
                                         );

    /* Allocate memory for Device Detailed Data */
    if (DevDetail) free(DevDetail);
    DevDetail = (PSP_DEVICE_INTERFACE_DETAIL_DATA) malloc(Length);
	Sz = Length;

    /* Set cbSize in the DevDetail structure */
    DevDetail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

    /* Get Device Interface Details */
    ok = SetupDiGetDeviceInterfaceDetail(DevInfo, 
                                         &DevData, 
                                         DevDetail, 
                                         Length, 
                                         NULL, 
                                         NULL
                                         );
    if (!ok) continue;

    /* Create File for Device Read/Write */
	DevHandle = CreateFile(DevDetail->DevicePath, 
                           0, 
                           FILE_SHARE_READ | FILE_SHARE_WRITE, 
                           (LPSECURITY_ATTRIBUTES)NULL,
                           OPEN_EXISTING, 
                           0, 
                           NULL
                           );

    if (DevHandle == INVALID_HANDLE_VALUE) continue;

    /* Get Preparsed Data */
    ok = HidD_GetPreparsedData(DevHandle, &PreparsedData);
    if (!ok) continue;

    /* Get Device's Capabilities */
    HidP_GetCaps(PreparsedData, &Capabilities);

    /* Free the PreparsedData */
    HidD_FreePreparsedData(PreparsedData);

    /* Remember Device Interface Detail Data for acceptable Devices */
    if ((Capabilities.UsagePage == 0xFF00) && (Capabilities.Usage == 0x0001)) {
      DevDetailData[DevCount] = DevDetail;
      DevDetailDataSz[DevCount] = Sz;
      DevInputReportSz[DevCount] = Capabilities.InputReportByteLength;
      DevOutputReportSz[DevCount] = Capabilities.OutputReportByteLength;
      DevFeatureReportSz[DevCount] = Capabilities.FeatureReportByteLength;
      if (DevDetailSelected) 
        if (!strcmp(DevDetailSelected->DevicePath, DevDetailData[DevCount]->DevicePath)) 
          DevSelected = DevCount;
      DevCount++;
      DevDetail = NULL;
    }

    CloseHandle (DevHandle);

  } while (DevCount < DEV_NUM);

  if (DevDetail) free(DevDetail);
  if (DevDetailSelected) free(DevDetailSelected);

  SetupDiDestroyDeviceInfoList (DevInfo);

  return (DevCount);
}


/*
 *  HID Get Name (Product String)
 *    Parameters:      num:   Device number
 *                     buf:   Pointer to buffer that receives data
 *                     sz:    Number of bytes to read
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_GetName(int num, char *buf, int sz) {
  HANDLE DevHandle;
  WCHAR  wbuf[128];
  int    i;
  BOOL   ok;

  if (DevDetailData[num] == NULL) return (FALSE);

  /* Create File for Device Read/Write */
  DevHandle = CreateFile(DevDetailData[num]->DevicePath, 
                         0, 
                         FILE_SHARE_READ | FILE_SHARE_WRITE, 
                         (LPSECURITY_ATTRIBUTES)NULL,
                         OPEN_EXISTING, 
                         0, 
                         NULL
                         );

  if (DevHandle == INVALID_HANDLE_VALUE) return (FALSE);

  ok = HidD_GetProductString(DevHandle, wbuf, sizeof(wbuf));

  if (ok) {
    for (i = 0; i < sz; i++) {
      *buf++ = (char)wbuf[i];
    }
  }

  CloseHandle (DevHandle);

  return (ok);
}


/*
 *  HID Get Input Report Size
 *    Parameters:      num:   Device number
 *    Return Value:    Number of bytes for Input Report
 */

int HID_GetInputReportSize(int num) {

  return (DevInputReportSz[num]);
}


/*
 *  HID Get Output Report Size
 *    Parameters:      num:   Device number
 *    Return Value:    Number of bytes for Output Report
 */

int HID_GetOutputReportSize(int num) {

  return (DevOutputReportSz[num]);
}


/*
 *  HID Get Feature Report Size
 *    Parameters:      num:   Device number
 *    Return Value:    Number of bytes for Output Report
 */

int HID_GetFeatureReportSize(int num) {

  return (DevFeatureReportSz[num]);
}


/*
 *  HID Open
 *    Parameters:      num:   Device number
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_Open(int num) {

  DevHandle = INVALID_HANDLE_VALUE;

  if (DevDetailData[num] == NULL) return (FALSE);

  /* Create File for Device Read/Write */
  DevHandle = CreateFile(DevDetailData[num]->DevicePath, 
                         GENERIC_READ | GENERIC_WRITE, 
                         FILE_SHARE_READ | FILE_SHARE_WRITE, 
                         (LPSECURITY_ATTRIBUTES)NULL,
                         OPEN_EXISTING, 
                         FILE_FLAG_OVERLAPPED, 
                         NULL
                         );

  if (DevHandle == INVALID_HANDLE_VALUE) return (FALSE);

  DevSelected = num;
  memset(&DevOverlapped, 0, sizeof(OVERLAPPED));

  return (TRUE);
}


/*
 *  HID Open
 *    Parameters:      None
 *    Return Value:    Device number
 */

int HID_GetSelectedDevice(void) {

  return (DevSelected);
}


/*
 *  HID Close
 *    Parameters:      None
 *    Return Value:    None
 */

void HID_Close() {

  DevSelected = -1;
  CancelIo(DevHandle);
  DevReadPending  = FALSE;
  if (DevHandle != INVALID_HANDLE_VALUE) {
    CloseHandle(DevHandle);
    DevHandle = INVALID_HANDLE_VALUE;
  }
}


/*
 *  HID Read
 *    Parameters:      buf:   Pointer to buffer that receives data
 *                     sz:    Number of bytes to read
 *                     cnt:   Pointer to number of bytes read
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_Read(BYTE *buf, DWORD sz, DWORD *cnt) {
  int last_err;

  /* Read from Device */
  if (!DevReadPending) {
    if (ReadFile(DevHandle, buf, sz, cnt, &DevOverlapped)) {
      return (TRUE);
    }
    DevReadPending = TRUE;
  }
  else {
    if (GetOverlappedResult(DevHandle, &DevOverlapped, cnt, FALSE)) {
      DevReadPending  = FALSE;
      return (TRUE);
    }
  }
  last_err = GetLastError();
  if ((last_err != ERROR_IO_INCOMPLETE) && (last_err != ERROR_IO_PENDING)) {
    DevReadPending  = FALSE;
    CancelIo(DevHandle);
    return (FALSE);
  }

  return (TRUE);
}


/*
 *  HID Write
 *    Parameters:      buf:   Pointer to buffer with data to write
 *                     sz:    Number of bytes to write
 *                     cnt:   Pointer to number of bytes written
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_Write(BYTE *buf, DWORD sz, DWORD *cnt) {

  /* Write to Device */
  if (WriteFile(DevHandle, buf, sz, cnt, &DevOverlapped))
    return (TRUE);
  if (GetLastError() == ERROR_IO_PENDING)
    return (TRUE);

  CancelIo(DevHandle);
  return (FALSE);
}


/*
 *  HID GetFeature
 *    Parameters:      buf:   Pointer to buffer to receive feature report
 *                     sz:    Size of feature report to receive
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_GetFeature(BYTE *buf, DWORD sz) {

  return (HidD_GetFeature(DevHandle, buf, sz));
}


/*
 *  HID SetFeature
 *    Parameters:      buf:   Pointer to buffer with report to send
 *                     sz:    Size of feature report to send
 *    Return Value:    TRUE - Success, FALSE - Error
 */

BOOL HID_SetFeature(BYTE *buf, DWORD sz) {

  return (HidD_SetFeature(DevHandle, buf, sz));
}
