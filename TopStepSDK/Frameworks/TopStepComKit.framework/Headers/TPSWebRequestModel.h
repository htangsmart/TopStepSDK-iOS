//
//  TPSWebRequestModel.h
//  flywearsdk
//
//  Created by Topstep on 2024/3/18.
//

#ifndef TPSWebRequestModel_h
#define TPSWebRequestModel_h

@interface TPSWebRequestModel : NSObject

@property(nonatomic, strong) NSString* url;
@property(nonatomic, strong) NSString* funName;
/**
 若存在云端下载的文件需要转发给手表，则要指定该文件在手表所存储的文件夹路径
 */
@property(nonatomic, strong) NSString* remoteSavePath;
@property(nonatomic, assign) int requestId;
@property(nonatomic, strong) NSString* appId;
@property(nonatomic, strong) NSDictionary* params;
@property(nonatomic, strong) NSArray* localPathArr;


@end

#endif /* FwWebRequestModel_h */
