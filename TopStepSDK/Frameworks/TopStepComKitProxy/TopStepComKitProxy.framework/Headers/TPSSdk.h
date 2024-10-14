//
//  TPSSdk.h
//  JieliJianKang
//
//  Created by Topstep on 2024/2/21.
//

#ifndef TPSSdk_h
#define TPSSdk_h


#import <TopStepComKit/ITPSConnectorAbility.h>
#import <TopStepComKit/ITPSFileAbility.h>
#import <TopStepComKit/ITPSContactAbility.h>
#import <TopStepComKit/ITPSNotificationEnableAbility.h>
#import <TopStepComKit/ITPSCardPocketAbility.h>
#import <TopStepComKit/ITPSEleBookAbility.h>
#import <TopStepComKit/ITPSAlbumAbility.h>
#import <TopStepComKit/ITPSMusicAbility.h>
#import <TopStepComKit/ITPSDialAbility.h>
#import <TopStepComKit/ITPSFinderAbility.h>
#import <TopStepComKit/ITPSDevInfoAbility.h>
#import <TopStepComKit/ITPSMiscSettingAbility.h>
#import <TopStepComKit/ITPSOTAAbility.h>
#import <TopStepComKit/ITPSSportTargetAbility.h>
#import <TopStepComKit/ITPSAlarmAbility.h>
#import <TopStepComKit/ITPSNavAbility.h>
#import <TopStepComKit/ITPSWeatherAbility.h>
#import <TopStepComKit/ITPSCurDayActivityAbility.h>
#import <TopStepComKit/ITPSActivityDataAbility.h>
#import <TopStepComKit/ITPSHeartRateDataAbility.h>
#import <TopStepComKit/ITPSSPO2Ability.h>
#import <TopStepComKit/ITPSStressDataAbility.h>
#import <TopStepComKit/ITPSSleepDataAbility.h>
#import <TopStepComKit/ITPSSportDataAbility.h>
#import <TopStepComKit/ITPSBloodPressureDataAbility.h>
#import <TopStepComKit/ITPSWorldClockAbility.h>
#import <TopStepComKit/ITPSPrayAbility.h>
#import <TopStepComKit/TPSExPeripheral.h>
#import <TopStepComKit/TPSDevFileDesModel.h>
#import <TopStepComKit/TPSHistorySleepModel.h>
#import <TopStepComKit/ITPSLanguageAbility.h>
#import <TopStepComKit/ITPSRemotePhotographyAbility.h>
#import <TopStepComKit/ITPSRemindSettingAbility.h>
#import <TopStepComKit/ITPSHttpAbility.h>
#import <TopStepComKit/ITPSSynchronousDataAbility.h>
#import <TopStepComKit/ITPSUserInfoAbility.h>
#import <TopStepComKitProxy/TPSSleepDataAbilityProxy.h>
#import <TopStepComKit/ITPSH5GameAbility.h>
#import <TopStepComKit/ITPSFemalHeltheAbility.h>
#import <TopStepComKit/ITPSHealthMonitorAbility.h>
#import <TopStepComKit/ITPSAISmartAssistantAbility.h>
#import <TopStepComKit/ITPSBodyTemperatureAbility.h>
#import <CoreBluetooth/CoreBluetooth.h>

typedef NS_ENUM(NSUInteger, TPSSDKType) {
    eTPSSDKUNKNOW,
    eTPSSDKFlyWear,
    eTPSSDKFitCloudPro,
    eTPSSDKFWM,//绅聚
};

typedef NS_ENUM(NSUInteger, TPSDeviceType) {
    TPSDeviceType_UNKNOW,
    TPSDeviceType_OSW850H,
    TPSDeviceType_OSW851H,
    TPSDeviceType_OSW805,
    TPSDeviceType_OSW802N,
};

@interface TPSDeviceModel : NSObject
/// 设备信息
@property (nonatomic, strong) CBPeripheral * peripheral;
/// 厂商信息对应的设备类型
@property (nonatomic, assign) TPSDeviceType deviceType;
/// 该设备使用的SDK类型
@property (nonatomic, assign) TPSSDKType sdkType;
/// 广播包信息
@property (nonatomic, copy) NSDictionary<NSString *, id> * advertisementData;
/// mac地址
@property (nonatomic, copy) NSString * mac;
/// 信号强度
@property (nonatomic, copy) NSNumber * rssi;
/// 设备名称
@property (nonatomic, copy) NSString * name;
@end

/// 设备连接回调
@protocol ITPSConnectDelegate <NSObject> @end
/// 设备应用回调
@protocol ITPSAppsDelegate <ITPSFinderAbilityDelegate, ITPSAISmartAssistantAbilityDelegate> @end
/// 设备信息回调
@protocol ITPSInfosDelegate <NSObject> @end
/// 数据同步回调
@protocol ITPSDatasSyncDelegate <NSObject> @end
/// 功能设置回调
@protocol ITPSSettingsDelegate <NSObject> @end

/// 需要实现的接口比较少时使用一个delegate统一管理，需要实现的接口比较多时，可分别设置delegate来管理
@protocol TPSSdkDelegate <ITPSConnectDelegate, ITPSAppsDelegate, ITPSInfosDelegate, ITPSDatasSyncDelegate, ITPSSettingsDelegate> @end

@interface TPSSdk : NSObject

/// 当前连接的设备信息  peripheral、rssi、advertisementData只有在首次连接时才保证有值
@property (nonatomic, strong, readonly) TPSDeviceModel * currentDevice;
/// 当前使用的SDK类型
@property (nonatomic, assign, readonly) TPSSDKType sdkType;

/// 获取可重连设备信息
- (void)getReconnectableDeviceInformation:(void(^)(NSString * _Nullable mac, TPSSDKType sdkType, TPSDeviceType deviceType, NSString * _Nullable deviceName))result;

/// 扫描设备
- (void)scanDeviceDuration:(int)duration result:(void(^)(TPSDeviceModel * _Nullable device, BOOL scanEnd))result;

/// 停止扫描
- (void)stopScan;

/// 重连上次连接的设备
- (void)reconnectLastDevice:(void(^)(TPSConnnectResult_State state, TPSConnnectResult_Error_Code errorCode))result delegate:(id<TPSSdkDelegate>)delegate extraParam:(TPSExtraConnectParam *)extraParam;

/// 连接设备
- (void)connectDevWithModel:(TPSDeviceModel *)model result:(void(^)(TPSConnnectResult_State state, TPSConnnectResult_Error_Code errorCode))result delegate:(id<TPSSdkDelegate>)delegate extraParam:(TPSExtraConnectParam *)extraParam;

/// 根据mac地址和设备类型连接设备
- (void)connectDevWithMacAddress:(NSString *)mac deviceType:(TPSDeviceType)deviceType result:(void(^)(TPSConnnectResult_State state, TPSConnnectResult_Error_Code errorCode))result delegate:(id<TPSSdkDelegate>)delegate extraParam:(TPSExtraConnectParam *)extraParam;

/// 根据mac地址查找设备
/// @param delayTime 超时时间
- (void)findDeviceByMacAddress:(NSString *)mac delayTime:(int)delayTime result:(void(^)(TPSDeviceModel * device))result;

/// 断开当前设备的连接 接口会先调用stopScan停止扫描
- (void)disconnect;

/// 解除当前设备的绑定
- (void)unbindDevWithUserId:(NSString*)userId result:(void(^)(NSError * error))result;

+(instancetype)share;

- (NSError *)tpsInitDeviceTypeWith:(TPSDeviceType)deviceType delegate:(id<TPSSdkDelegate>)delegate NS_DEPRECATED_IOS(1_0, 2_0, "改为在连接设备时根据设备类型自动初始化，不在需要手动初始化");
- (NSError *)tpsInitDeviceTypeWith:(TPSDeviceType)deviceType
           connectDelegate:(id<ITPSConnectDelegate>)connectDelegate
              appsDelegate:(id<ITPSAppsDelegate>)appsDelegate
             infosDelegate:(id<ITPSInfosDelegate>)infosDelegate
         datasSyncDelegate:(id<ITPSDatasSyncDelegate>)datasSyncDelegate
          settingsDelegate:(id<ITPSSettingsDelegate>)settingsDelegate NS_DEPRECATED_IOS(1_0, 2_0, "改为在连接设备时根据设备类型自动初始化，不在需要手动初始化");

/// 查询该设备是否支持某个功能 ability不存在或未实现selector均返回false
- (BOOL)supportSelector:(SEL)selector ability:(id)ability;

/**
 设备连接相关
 */
@property(nonatomic, strong, readonly) id<ITPSConnectorAbility> connectorAbility NS_DEPRECATED_IOS(1_0, 2_0, "请使用TPSSDK中关于蓝牙连接的相关方法");

/**
 文件传输相关，获取手表指定文件夹的文件列表及向对应文件夹传输文件
 */
@property(nonatomic, strong, readonly) id<ITPSFileAbility> fileAbility;

/**
 联系人列表相关，增删改查手表的联系人列表
 */
@property(nonatomic, strong, readonly) id<ITPSContactAbility> contactAbility;

/**
 消息通知相关，指定要不要将类似微信、qq等的消息发送到手表上
 */
@property(nonatomic, strong, readonly) id<ITPSNotificationEnableAbility> notificationEnableAbility;

/**
 卡包及名片二维码相关。将收款二维码或名片二维码上传到手表及相关管理。
 */
@property(nonatomic, strong, readonly) id<ITPSCardPocketAbility> cardPocketAbility;

/**
 电子书相关。增删改查手表的电子书列表，及传送电子书（txt格式）到手表
 */
@property(nonatomic, strong, readonly) id<ITPSEleBookAbility> eleBookAbility;

/**
 相册相关。增删改查手表的相册列表，及传送图片到手表
 */
@property(nonatomic, strong, readonly) id<ITPSAlbumAbility> albumAbility;

/**
 音乐相关。增删改查手表的音乐列表，及传送音乐到手表
 */
@property(nonatomic, strong, readonly) id<ITPSMusicAbility> musicAbility;

/**
 表盘相关。增删改查手表的表盘列表，及传送表盘文件到手表
 */
@property(nonatomic, strong, readonly) id<ITPSDialAbility> dialAbility;

/**
 查找手机手表相关。发送命令后，手表或手机会震动，提醒用户手表或手机在哪里
 */
@property(nonatomic, strong, readonly) id<ITPSFinderAbility> finderAbility;

/**
 设备基本信息相关。获取设备的版本号、屏幕尺寸等信息
 */
@property(nonatomic, strong, readonly) id<ITPSDevInfoAbility> devInfoAbility;

/**
 杂设置项相关。常见的一些设置收集，如单位制、是否开启全天心率检测等。
 */
@property(nonatomic, strong, readonly) id<ITPSMiscSettingAbility> miscSettingAbility;

/**
 OTA相关。
 */
@property(nonatomic, strong, readonly) id<ITPSOTAAbility> OTAAbility;

/**
 运动目标设置。
 */
@property(nonatomic, strong, readonly) id<ITPSSportTargetAbility> sportTargetAbility;

/**
 闹钟设置。
 */
@property(nonatomic, strong, readonly) id<ITPSAlarmAbility> alarmAbility;

/**
 导航功能相关。
 */
@property(nonatomic, strong, readonly) id<ITPSNavAbility> navAbility;

/**
 天气功能相关。
 */
@property(nonatomic, strong, readonly) id<ITPSWeatherAbility> weatherAbility;

/**
 当日活动数据概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSCurDayActivityAbility> curDayActivityAbility;

/**
 活动数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSActivityDataAbility> activityDataAbility;

/**
 心率数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSHeartRateDataAbility> heartRateDataAbility;

/**
 血氧数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSSPO2Ability> SPO2Ability;

/**
 压力数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSStressDataAbility> stressDataAbility;

/**
 睡眠数据详情概览相关。
 */
@property(nonatomic, strong, readonly) TPSSleepDataAbilityProxy* sleepDataAbility;

/**
 运动数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSSportDataAbility> sportDataAbility;

/**
 血压数据详情概览相关。
 */
@property(nonatomic, strong, readonly) id<ITPSBloodPressureDataAbility> bloodPressureDataAbility;

/**
 世界时钟
 */
@property(nonatomic, strong, readonly) id<ITPSWorldClockAbility> worldClockAbility;

/**
 祈祷
 */
@property(nonatomic, strong, readonly) id<ITPSPrayAbility> prayAbility;

/**
 语言设置
 */
@property (nonatomic,strong, readonly) id<ITPSLanguageAbility> languageAbility;

/**
 遥控拍照
 */
@property (nonatomic,strong, readonly) id<ITPSRemotePhotographyAbility> remotePhotographyAbility;

/**
 提醒设置
 */
@property (nonatomic,strong, readonly) id<ITPSRemindSettingAbility>  remindSettingAbility;

/**
 数据同步功能
 */
@property(nonatomic, strong, readonly) id<ITPSSynchronousDataAbility> synchronousDataAbility;

/**
 http协议透传功能
 */
@property(nonatomic, strong, readonly) id<ITPSHttpAbility> httpAbility;


@property(nonatomic, strong, readonly) id<ITPSUserInfoAbility> userInfoAbility;

@property(nonatomic, strong, readonly) id<ITPSH5GameAbility> h5GameAbility;

/**
 女性健康
 */
@property(nonatomic, strong, readonly) id<ITPSFemalHeltheAbility> femalHeltheAbility;

/**
 健康
 */
@property(nonatomic, strong, readonly) id<ITPSHealthMonitorAbility> healthMonitorAbility;

/// AI智能助手
@property(nonatomic, strong, readonly) id<ITPSAISmartAssistantAbility> AISmartAssistantAbility;

/// 体温
@property(nonatomic, strong, readonly) id<ITPSBodyTemperatureAbility> bodyTemperatureAbility;
@end


#endif /* TPSSdk_h */

