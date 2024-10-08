//
//  SleepUtil.h
//  TopStepComKit
//
//  Created by Topstep on 2024/4/18.
//

#ifndef SleepUtil_h
#define SleepUtil_h

#import <TopStepComKitProxy/TPSDaySleepEntity.h>

@interface SleepUtil : NSObject

typedef void(^TPSSleepUtilDaySleepEntityCallback)(NSArray<TPSDaySleepEntity*>* _Nullable daySleepEntityList);

+(instancetype)share;

-(void)getDaySleepEntityList:(NSArray<TPSHistorySleepModel*>*) historySleepModelList block:(TPSSleepUtilDaySleepEntityCallback _Nullable)block;

@end



#endif /* SleepUtil_h */
