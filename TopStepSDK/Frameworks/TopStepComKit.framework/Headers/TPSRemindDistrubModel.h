//
//  TPSRemindDistrubModel.h
//  TopStepComKit
//
//  Created by 磐石 on 2024/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TPSRemindDistrubModel : NSObject

@property (nonatomic,assign) BOOL isEnabled;

@property (nonatomic,assign) double start;

@property (nonatomic,assign) double end;


//// 851 个性化提醒
//+ (TPSRemindDistrubModel *)configModelWithFitCloudRemind:(FitCloudPersonalizedReminderObject *)remindObject;

- (NSDictionary *)toDictonary;

@end

NS_ASSUME_NONNULL_END
