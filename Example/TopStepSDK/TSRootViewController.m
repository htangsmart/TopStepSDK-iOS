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
#import <TopStepComKitProxy/TopStepComKitProxy-Swift.h>
#endif

#if __has_include(<TopStepComKitFitCloud/TopStepComKitFitCloud.h>)
    #import <TopStepComKitFitCloud/TopStepComKitFitCloud.h>
#endif
//#import <TopStepComKitFitCloud/TopStepComKitFitCloud.h>

#import "TopStepCoreClass.h"

@interface TSRootViewController ()<UITableViewDelegate, UITableViewDataSource, TPSSdkDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray <NSArray *>*dataArray;

@end

@implementation TSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主要功能Demo";
   NSArray *sec1 = @[
    @"蓝牙连接测试",
    @"手表链接成功自动同步逻辑",
    @"搜索+绑定流程修改（手表平台选择）",
    @"查找手表",
    @"查找手机",
    @"固件OTA",
    @"女性健康",
    @"吃药、喝水、久坐、自定义配置",
    @"单位配置",
    @"电量",
    @"联系人+紧急联系人",
    @"活动目标配置",
    @"闹钟",
    @"时间格式",
    @"时间同步",
    @"运动数据",
    @"遥控拍照",
    @"消息通知",
    @"解绑设备",
    @"电子书",
    @"关机+重启",
    @"恢复出厂",
    @"SOS开关",
    @"世界时钟",
    @"手表语言切换",
    @"体温功能开发"];
    
    NSArray *sec2 = @[
    @"天气开关",
    @"天气推送",
    @"心率详情页开发",
    @"心率实时测量",
    @"心率测量数据",
    @"血压实时测量",
    @"血压测量数据",
    @"血氧实时测量",
    @"血氧测量数据",
    @"压力实时测量",
    @"压力测量数据",
    @"压力详情页开发",
    @"音乐推送",
    @"心率监测和报警",
    @"血压监测和报警",
    @"血氧监测和报警",
    @"压力监测和报警",];

    NSArray *sec3 = @[
    @"睡眠配置（三端睡眠配置项设置)",
    @"表盘（内置、云端、自定义）开发+组件化)",
    @"活动数据-首页活动数据联调",
    @"活动数据-首页活动数据UI调整",
    @"活动数据-详情页数据联调",
    @"Fitcloudpro新增log指令联调"
    ];
    
    self.dataArray = @[sec1, sec2, sec3];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"功能-%ld", section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray[section].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = self.dataArray[indexPath.section][indexPath.row];
    NSLog(@"标题====%@",title);
    if ([title isEqualToString:@"蓝牙连接测试"]) {
        [TPSSdk.share tpsInitDeviceTypeWith:TPSDeviceType_OSW850H delegate:self];
    }else if ([title isEqualToString:@"手表链接成功自动同步逻辑"]) {
        
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
