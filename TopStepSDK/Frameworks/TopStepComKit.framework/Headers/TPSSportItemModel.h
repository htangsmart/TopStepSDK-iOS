//
//  TPSSportItemModel.h
//  flywearsdk
//
//  Created by Topstep on 2024/4/1.
//

#ifndef TPSSportItemModel_h
#define TPSSportItemModel_h

@interface TPSSportItemModel : NSObject

@property (nonatomic, assign) long sport_id;
@property (nonatomic, assign) int type;
@property (nonatomic, assign) long start_time;//单位秒
@property (nonatomic, assign) long duration;//单位秒
@property (nonatomic, assign) double distance;//距离米
@property (nonatomic, assign) double calories;//单位千卡
@property (nonatomic, assign) int heartrate;//次/min
@property (nonatomic, assign) double pace;//单位秒/百米
@property (nonatomic, assign) int step;
@property (nonatomic, assign) double cadence;//单位步/分钟

@end

#endif /* FwSportItemModel_h */
