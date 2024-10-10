//
//  DialProgressModel.h
//  JieliJianKang
//
//  Created by Topstep on 2024/1/23.
//

#ifndef TPSDialProgressModel_h
#define TPSDialProgressModel_h

@class FwDialProgressModel;
@interface TPSDialProgressModel : NSObject

typedef NS_ENUM(UInt8,TPSDialProgressModel_Event_Type){
    TPSDialProgressModel_Event_Type_OnSuccess = 0,  //成功不一定完毕
    TPSDialProgressModel_Event_Type_OnFailed = 1,
    TPSDialProgressModel_Event_Type_OnProcess = 2,
    TPSDialProgressModel_Event_Type_OnInstalling = 3,
    TPSDialProgressModel_Event_Type_OnCompleted = 4, //完毕位于成功之后触发
};

///1.0为满进度
@property(nonatomic, assign) float percent;
@property(nonatomic, assign) TPSDialProgressModel_Event_Type eventType;

+ (instancetype)progresslWithPercent:(CGFloat)percent eventType:(TPSDialProgressModel_Event_Type)eventType;

@end


#endif /* DialProgressModel_h */
