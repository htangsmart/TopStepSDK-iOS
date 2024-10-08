//
//  TPSBodyTemperatureConfigModel.h
//  TopStepComKit
//
//  Created by luigi on 2024/9/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TPSBodyTemperatureConfigModel : NSObject
/// 体温监测是否开启
@property (nonatomic, assign) BOOL open;
/// 监测开始时间 以0点开始的分钟数，如8点表示为 8*60 = 480
@property (nonatomic, assign) NSInteger start;
/// 监测结束时间 以0点开始的分钟数，如8点表示为 8*60 = 480
@property (nonatomic, assign) NSInteger end;
/// 监测间隔
@property (nonatomic, assign) NSInteger interval;
@end

NS_ASSUME_NONNULL_END
