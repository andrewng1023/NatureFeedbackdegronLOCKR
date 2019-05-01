// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the MTUSBDLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// MTUSBDLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
typedef int SDK_RETURN_CODE;

#ifdef SDK_EXPORTS
#define SDK_API extern "C" __declspec(dllexport) SDK_RETURN_CODE _cdecl
#else
#define SDK_API extern "C" __declspec(dllimport) SDK_RETURN_CODE _cdecl
#endif

#define  MAX_PROFILE_ITEM     128

#define	DISABLE_MODE	0
#define NORMAL_MODE	1
#define STROBE_MODE     2
#define TRIGGER_MODE    3

#define MODULE_AA	0
#define MODULE_AV	1
#define MODULE_SA	2
#define MODULE_SV	3
#define MODULE_MA	4
#define MODULE_CA	5
#define MODULE_HA	6
#define MODULE_HV	7
#define MODULE_FA	8
#define MODULE_FV	9
#define MODULE_XA	10
#define MODULE_XV	11
#define MODULE_QA	12

#pragma pack(1)
typedef struct {
    int Normal_CurrentMax;
    int Normal_CurrentSet;

    int Strobe_CurrentMax;
    int Strobe_RepeatCnt;
    int Strobe_Profile[MAX_PROFILE_ITEM][2];

    int Trigger_CurrentMax;
    int Trigger_Polarity;
    int Trigger_Profile[MAX_PROFILE_ITEM][2];
} TLedChannelData;
#pragma pack()

// Export functions:
SDK_API MTUSB_LEDDriverInitDevices( void );
SDK_API MTUSB_LEDDriverOpenDevice( int DeviceIndex );
SDK_API MTUSB_LEDDriverCloseDevice( int DevHandle );
SDK_API MTUSB_LEDDriverSerialNumber( int DevHandle, char *SerNumber, int Size );
SDK_API MTUSB_LEDDriverDeviceChannels( int DevHandle );
SDK_API MTUSB_LEDDriverDeviceModuleType( int DevHandle);
SDK_API MTUSB_LEDDriverSetMode( int DevHandle, int Channel, int Mode );
SDK_API MTUSB_LEDDriverSetNormalPara( int DevHandle, int Channel, TLedChannelData *LedChannelDataPtr );
SDK_API MTUSB_LEDDriverSetNormalCurrent( int DevHandle, int Channel, int Current );
SDK_API MTUSB_LEDDriverSetStrobePara( int DevHandle, int Channel, TLedChannelData *LedChannelDataPtr );
SDK_API MTUSB_LEDDriverSetTriggerPara( int DevHandle, int Channel, TLedChannelData *LedChannelDataPtr );
SDK_API MTUSB_LEDDriverResetDevice( int DevHandle );
SDK_API MTUSB_LEDDriverStorePara( int DevHandle );
SDK_API MTUSB_LEDDriverRestoreDefault( int DevHandle );
SDK_API MTUSB_LEDDriverGetLoadVoltage( int DevHandle, int Channel );
SDK_API MTUSB_LEDDriverGetCurrentPara( int DevHandle, int Channel,TLedChannelData *LedChannelDataPtr,int *Mode );
SDK_API MTUSB_LEDDriverSendCommand( int DevHandle, char *CommandString );