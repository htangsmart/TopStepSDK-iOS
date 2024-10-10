//
//  IWearFinderSync.h
//  JieliJianKang
//
//  Created by Topstep on 2023/12/18.
//

#ifndef ITPSFinderAbility_h
#define ITPSFinderAbility_h

#import <TopStepComKit/ITPSWearBaseAbility.h>
#import <TopStepComKit/TPSMusicUpdateModel.h>
#import <TopStepComKit/ITPSFileAbility.h>
#import <TopStepComKit/TPSMusicModel.h>
//#import <ReactiveObjC.h>

@protocol ITPSFinderAbilityDelegate <NSObject>

/// 手表发起寻找手机，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch searches for the phone. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchStartSearchingForPhone:(void(^_Nullable)(NSError * _Nullable error))block;

/// 手表停止寻找手机，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch stops searching for the phone. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchStopSearchingForPhone:(void(^_Nullable)(NSError * _Nullable error))block;

/// 手表告知app手表被找到，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch informs the app that the watch has been found. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchWasFound:(void(^_Nullable)(NSError * _Nullable error))block;
@end
    
@protocol ITPSFinderAbility <NSObject, ITPSWearBaseAbility>
@required
+ (instancetype _Nonnull)share;

/// 手表通过finderDelegate通知app寻找功能的相关事件
/// The watch notifies the app of events related to the search function through the finderDelegate
@property (nonatomic, weak) id<ITPSFinderAbilityDelegate> _Nullable finderDelegate;

/// app发起寻找手表，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The app searches for the watch. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)phoneStartSearchingForWacth:(void(^_Nullable)(NSError * _Nullable error))block;

/// app停止寻找手表，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The app stops searching for the watch. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)phoneStopSearchingForWacth:(void(^_Nullable)(NSError * _Nullable error))block;

/// app告知手表手机被找到，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The app tells the watch that the phone has been found. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)phoneWasFound:(void(^_Nullable)(NSError * _Nullable error))block;

@end


#endif /* IWearAlbumSync_h */
