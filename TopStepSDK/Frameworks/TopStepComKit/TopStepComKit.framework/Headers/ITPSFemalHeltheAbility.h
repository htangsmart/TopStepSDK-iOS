//
//  ITPSFemalHeltheAbility.h
//  TopStepComKit
//
//  Created by luigi on 2024/7/15.
//

#ifndef ITPSFemalHeltheAbility_h
#define ITPSFemalHeltheAbility_h

#import <TopStepComKit/ITPSWearBaseAbility.h>
#import <TopStepComKit/TPSFemalHeltheModel.h>

@protocol ITPSFemalHeltheAbility <NSObject, ITPSWearBaseAbility>

typedef void(^TPSFemalHeltheCallback)(TPSFemalHeltheModel * femalHeltheModel);

+ (instancetype)share;

- (void)getFemalHeltheData:(TPSFemalHeltheCallback)block;

- (void)sendFemalHeltheData:(TPSFemalHeltheModel *)dataModel block:(void(^)(BOOL isSendOK))block;

@end

#endif /* ITPSFemalHeltheAbility_h */
