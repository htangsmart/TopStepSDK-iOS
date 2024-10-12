//
//  TSDeviceManager.h
//  TopStepSDK_Example
//
//  Created by luigi on 2024/10/12.
//  Copyright © 2024 topstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TopStepComKitProxy/TopStepComKitProxy.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSDeviceManager : NSObject<TPSSdkDelegate>
+ (instancetype)share;
@end

NS_ASSUME_NONNULL_END
