//
//  TSRootViewController.m
//  TopStepSDK_Example
//
//  Created by topstep on 2024/10/8.
//  Copyright © 2024 topstep. All rights reserved.
//

#import "TSRootViewController.h"
#if __has_include(<TopStepComKitProxy/TopStepComKitProxy.h>)
    #import <TopStepComKitProxy/TopStepComKitProxy.h>
#endif

#if __has_include(<TopStepComKitFitCloud/TopStepComKitFitCloud.h>)
    #import <TopStepComKitFitCloud/TopStepComKitFitCloud.h>
#endif
//#import <TopStepComKitFitCloud/TopStepComKitFitCloud.h>
#import "TopStepCoreClass.h"

@interface TSRootViewController ()<UITableViewDelegate, UITableViewDataSource, TPSSdkDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;

@end

@implementation TSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主要功能Demo";
    
    self.dataArray = @[@"蓝牙连接", @"血压", @"心率", @"设置", @"健康", @"其他功能设置", @"表盘"];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
#if __has_include(<TopStepComKitFitCloud/TopStepComKitFitCloud.h>)
    NSLog(@"编译了fitcloud2");
#endif

    TopStepCoreClass *obj = [[TopStepCoreClass alloc] init];
    [obj testFunc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [TPSSdk.share tpsInitDeviceTypeWith:TPSDeviceType_OSW850H delegate:self];
    }
    
}

#pragma mark - ITPSFinderAbilityDelegate

/// 手表发起寻找手机，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch searches for the phone. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchStartSearchingForPhone:(void(^_Nullable)(NSError * _Nullable error))block {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"38938" object:nil userInfo:nil];
}

/// 手表停止寻找手机，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch stops searching for the phone. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchStopSearchingForPhone:(void(^_Nullable)(NSError * _Nullable error))block {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"jjfie" object:nil userInfo:nil];
}

/// 手表告知app手表被找到，block中的error为该接口调用结果，回调nil则接口调用成功。
/// The watch informs the app that the watch has been found. The error in the block is the result of the interface call. If the callback is nil, the interface call is successful.
- (void)watchWasFound:(void(^_Nullable)(NSError * _Nullable error))block {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fefefe" object:nil userInfo:nil];
}

#pragma mark - ITPSAISmartAssistantAbilityDelegate
/// 监听手表发起的问答
/// @param voice 问题录音，直接输入文字进行提问则此项为空 rate 16000.0f 单通道 16位 PCM
- (void)watchSendQuestionToPhone:(NSData * _Nonnull)voice {
    
  
}

@end
