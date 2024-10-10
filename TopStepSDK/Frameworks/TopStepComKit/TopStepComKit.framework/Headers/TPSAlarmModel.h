//
//  AlarmEntity.h
//  JieliJianKang
//
//  Created by Topstep on 2023/8/31.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(uint8_t, TPSAlarmRepeat) {
    TPSAlarmRepeatNone      = 0,
    TPSAlarmRepeatMonday    = 1 << 0,
    TPSAlarmRepeatTuesday   = 1 << 1,
    TPSAlarmRepeatWednesday = 1 << 2,
    TPSAlarmRepeatThursday  = 1 << 3,
    TPSAlarmRepeatFriday    = 1 << 4,
    TPSAlarmRepeatSaturday  = 1 << 5,
    TPSAlarmRepeatSunday    = 1 << 6,
};

@interface TPSAlarmModel : NSObject

@property(nonatomic,copy)NSString *alarmId;
/// 闹钟名称
@property(nonatomic,strong)NSString *label;
@property(nonatomic,assign)int  hour;
@property(nonatomic,assign)int  min;
@property(nonatomic,assign)BOOL  enable;
@property(nonatomic,assign)BOOL isRemindLater;
/// 闹钟备注
@property (nonatomic, copy) NSString * remark;
@property (nonatomic, assign) TPSAlarmRepeat repeatOptions;




@end

