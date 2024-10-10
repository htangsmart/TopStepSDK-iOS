//
//  IFwH5GameAbility.h
//  flywearsdk
//
//  Created by 磐石 on 2024/3/12.
//

#import <TopStepComKit/ITPSWearBaseAbility.h>

NS_ASSUME_NONNULL_BEGIN
@class RACSubject<ValueType>;

@protocol ITPSH5GameAbility <ITPSWearBaseAbility>

+ (instancetype _Nonnull )share;

- (void)gameStart;

- (void)gameFinished;

- (void)gamePause;

- (void)gameContinue;

-(RACSubject*)observeGameValue;

- (void)sensorDataWithXGravity:(SInt16)xGravity yGravity:(SInt16)yGravity zGravity:(SInt16)zGravity;

- (BOOL)isSupportSensorGame;

@end

NS_ASSUME_NONNULL_END
