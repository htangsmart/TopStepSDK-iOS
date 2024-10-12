//
//  TSDeviceManager.m
//  TopStepSDK_Example
//
//  Created by luigi on 2024/10/12.
//  Copyright © 2024 topstep. All rights reserved.
//

#import "TSDeviceManager.h"

@implementation TSDeviceManager
+ (instancetype)share {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    return instance;
}



- (void)watchStartSearchingForPhone:(void (^ _Nullable)(NSError * _Nullable))block { 
    
}

- (void)watchStopSearchingForPhone:(void (^ _Nullable)(NSError * _Nullable))block { 
    
}

- (void)watchWasFound:(void (^ _Nullable)(NSError * _Nullable))block { 
    
}

- (void)watchSendQuestionToPhone:(NSData * _Nonnull)voice { 
    
}

@end
