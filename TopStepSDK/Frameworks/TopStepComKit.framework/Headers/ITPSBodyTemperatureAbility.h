//
//  ITPSBodyTemperatureAbility.h
//  TopStepComKit
//
//  Created by luigi on 2024/9/2.
//

#ifndef ITPSBodyTemperatureAbility_h
#define ITPSBodyTemperatureAbility_h
#import <TopStepComKit/ITPSWearBaseAbility.h>
#import <TopStepComKit/TPSBodyTemperatureModel.h>
#import <TopStepComKit/TPSBodyTemperatureConfigModel.h>

@protocol ITPSBodyTemperatureAbility <NSObject, ITPSWearBaseAbility>

/// 是否支持体温
- (BOOL)supportBodyTemperature;
/// 是否支持体温预警配置
- (BOOL)supportBodyTemperatureConfig;

/// 根据时间区间获取体温数据
-(void)getHistoryBodyTemperature:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime block:(void(^_Nullable)(NSArray<TPSBodyTemperatureModel *> * _Nullable datas, NSError * _Nullable error))block;
/// 获取体温预警配置
-(void)getBodyTemperatureConfig:(void(^_Nullable)(TPSBodyTemperatureConfigModel * _Nullable model, NSError * _Nullable error))block;
/// 设置体温预警配置
-(void)setBodyTemperatureConfig:(TPSBodyTemperatureConfigModel * _Nonnull)model block:(void(^_Nullable)(NSError * _Nullable error))block;
@end

#endif /* ITPSBodyTemperatureAbility_h */
