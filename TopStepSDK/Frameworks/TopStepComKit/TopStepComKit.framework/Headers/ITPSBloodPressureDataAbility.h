//
//  ITPSBloodPressureDataAbility.h
//  JieliJianKang
//
//  Created by Topstep on 2024/2/21.
//

#ifndef ITPSBloodPressureDataAbility_h
#define ITPSBloodPressureDataAbility_h

#import <TopStepComKit/TPSHistoryBloodPressureModel.h>
#import <TopStepComKit/ITPSWearBaseAbility.h>
#import <TopStepComKit/TPSBloodPressureConfigModel.h>
#import <TopStepComKit/TPSWearBlockTypeDef.h>

@protocol ITPSBloodPressureDataAbility <NSObject,ITPSWearBaseAbility>

typedef void(^TPSHistoryBloodPressureCallback)(NSArray<TPSHistoryBloodPressureModel*>* _Nullable bloodPressureList);
typedef void(^TPSBloodPressureConfigCallback)(TPSBloodPressureConfigModel* _Nullable configModel);

+(instancetype _Nonnull )share;

-(void)getHistoryBloodPressure:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime block:(TPSHistoryBloodPressureCallback _Nullable)block;
-(void)getBloodPressureConfig:(TPSBloodPressureConfigCallback _Nonnull )block;
-(void)setBloodPressureConfig:(TPSBloodPressureConfigModel*)model block:(TPSSendMsgResult)block;

@end


#endif /* ITPSBloodPressureDataAbility_h */
