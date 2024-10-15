//
//  TopStepCoreClass.m
//  Pods-TopStepSDK_Example
//
//  Created by topstep on 2024/10/2.
//

#import "TopStepCoreClass.h"
#import <FitCloudKit/FitCloudKit.h>
//#import <TopStepComKitFitCloud/TopStepComKitFitCloud.h>
#import <TopStepComKitFitCloud/FitCloudSdk.h>
@implementation TopStepCoreClass

- (void)testFunc {
    NSLog(@"测试一下函数1");
    
#if TopStepSDK_Platform_fitcloud
    NSLog(@"测试一下宏定义TopStepSDK_Platform_fitcloud");

#endif
    
//    [[FitCloudSdk share] initSdk];
}

@end
