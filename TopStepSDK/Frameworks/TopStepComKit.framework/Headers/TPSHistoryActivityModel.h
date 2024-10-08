//
//  TSActivityRecordModel.h
//  JieliJianKang
//
//  Created by Topstep on 2023/8/1.
//

#ifndef TPSHistoryActivityModel_h
#define TPSHistoryActivityModel_h

@interface TPSHistoryActivityModel : NSObject


@property (nonatomic, assign) long start_time;//单位秒
/**
 单位已经改为分钟，含义改为活动(非运动)的时间
 */
@property (nonatomic, assign) int stand;

@property (nonatomic, assign) int steps;
@property (nonatomic, assign) int sport;//单位分钟，运动时长
@property (nonatomic, assign) int number;//表示这个时间段内的活动次数
@property (nonatomic, assign) double calorie;//表示这个时间段内活动消耗的卡路里，单位千卡
@property (nonatomic, assign) double distance;//表示这个时间段内活动的距离，单位米

-(instancetype)initWithTsDbDict:(NSDictionary *)dict;
-(instancetype)initWithNSData:(NSData*)jsonData;
-(NSData*)toJsonNSData;


+ (int)totalStepsInArray:(NSArray *)activitys;
+ (int)totalSportDuringInArray:(NSArray *)activitys;
+ (int)totalActivityTimesInArray:(NSArray *)activitys;
+ (int)totalCaloriesInArray:(NSArray *)activitys;
+ (int)totalDistanceInArray:(NSArray *)activitys;
+ (int)totalActivityDuringInArray:(NSArray *)activitys;

+ (TPSHistoryActivityModel *)totalActivityWithArray:(NSArray <TPSHistoryActivityModel *> *)records;

@end

#endif /* TSActivityRecordModel_h */
