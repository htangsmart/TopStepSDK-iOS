//
//  ITPSAISmartAssistantAbility.h
//  TopStepComKit
//
//  Created by luigi on 2024/8/30.
//

#ifndef ITPSAISmartAssistantAbility_h
#define ITPSAISmartAssistantAbility_h
#import <TopStepComKit/ITPSWearBaseAbility.h>

@protocol ITPSAISmartAssistantAbilityDelegate <NSObject>
/// 监听手表发起的问答
/// @param voice 问题录音，直接输入文字进行提问则此项为空 rate 16000.0f 单通道 16位 PCM
- (void)watchSendQuestionToPhone:(NSData * _Nonnull)voice;
@end

@protocol ITPSAISmartAssistantAbility <NSObject, ITPSWearBaseAbility>
/// 手机将收到的问答发送给手表
/// @param voice 问题录音，直接输入文字进行提问则此项为空 rate 16000.0f 单通道 16位 PCM
/// @param answer 大模型返回的回答(返回的回答是分段返回的，根据answerEnd判断回答是否结束)
/// @param answerEnd 大模型返回的回答是否结束
/// @param result 调用接口发送给手表的结果
- (void)phoneSendMsgToWatchWithQuestionVoice:(nullable NSData *)voice
                                      answer:(NSString * _Nonnull)answer
                                      answerEnd:(BOOL)answerEnd
                                      result:(nullable void(^)(NSError * _Nullable error))result;

@property (nonatomic, weak) id<ITPSAISmartAssistantAbilityDelegate> _Nullable AISmartAssistantDelegate;

@end

#endif /* ITPSAISmartAssistantAbility_h */
