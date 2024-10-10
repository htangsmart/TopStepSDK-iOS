//
//  TPSBodyTemperatureModel.h
//  TopStepComKit
//
//  Created by luigi on 2024/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TPSBodyTemperatureModel : NSObject
/// 记录时刻
@property (nonatomic, copy) NSDate * recordMoment;
/// 腕温（摄氏度）
@property (nonatomic, assign) CGFloat wristTemperature;
/// 体温（摄氏度）
@property (nonatomic, assign) CGFloat bodyTemperature;
@end

NS_ASSUME_NONNULL_END
