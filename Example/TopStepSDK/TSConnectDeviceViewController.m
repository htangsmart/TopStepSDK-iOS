//
//  TSConnectDeviceViewController.m
//  TopStepSDK_Example
//
//  Created by luigi on 2024/10/12.
//  Copyright © 2024 topstep. All rights reserved.
//

#import "TSConnectDeviceViewController.h"
#import "TSDeviceManager.h"
#import "TSRootViewController.h"

@interface TSConnectDeviceViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton * connectStateBtn;
@property (nonatomic, strong) UIButton * funcationListBtn;
@property (nonatomic, strong) UITableView * deviceTbaleView;

@property (nonatomic, strong) NSMutableArray<TPSDeviceModel *> * deviceArray;

@property (nonatomic, assign) BOOL scanning;
@end

@implementation TSConnectDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGRect frame = self.view.frame;
    self.connectStateBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(frame) - 160, CGRectGetWidth(frame) - 100, 50)];
    [_connectStateBtn setTitle:@"点击开始扫描设备" forState:(UIControlStateNormal)];
    [_connectStateBtn setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    [_connectStateBtn setTitleColor:UIColor.grayColor forState:(UIControlStateDisabled)];
    _connectStateBtn.layer.cornerRadius = 8;
    _connectStateBtn.layer.masksToBounds = true;
    _connectStateBtn.layer.borderWidth = 1;
    _connectStateBtn.layer.borderColor = UIColor.blackColor.CGColor;
    _connectStateBtn.enabled = true;
    [_connectStateBtn addTarget:self action:@selector(connectStateBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_connectStateBtn];
    
    self.funcationListBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(frame) - 100, CGRectGetWidth(frame) - 100, 50)];
    [_funcationListBtn setTitle:@"功能列表" forState:(UIControlStateNormal)];
    [_funcationListBtn setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    [_funcationListBtn setTitleColor:UIColor.grayColor forState:(UIControlStateDisabled)];
    _funcationListBtn.layer.cornerRadius = 8;
    _funcationListBtn.layer.masksToBounds = true;
    _funcationListBtn.layer.borderWidth = 1;
    _funcationListBtn.layer.borderColor = UIColor.blackColor.CGColor;
    _funcationListBtn.enabled = false;
    [_funcationListBtn addTarget:self action:@selector(funcationListBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_funcationListBtn];
    
    self.deviceTbaleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, CGRectGetHeight(frame) - 200) style:(UITableViewStylePlain)];
    _deviceTbaleView.backgroundColor = UIColor.whiteColor;
    _deviceTbaleView.delegate = self;
    _deviceTbaleView.dataSource = self;
    [_deviceTbaleView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_deviceTbaleView];
    
    self.deviceArray = [[NSMutableArray alloc] init];
    [[TPSSdk share] getReconnectableDeviceInformation:^(NSString *mac, TPSSDKType sdkType, TPSDeviceType deviceType, NSString *deviceName) {
       
       // 判断是否有可重连设备
        if ([mac isKindOfClass:NSString.class] && mac.length > 0) {
            
            [self reconnect];
        }
    }];
}

- (void)funcationListBtnAction {
    
    [self.navigationController pushViewController:TSRootViewController.new animated:true];
}

- (void)unbindAction {
    
    [_connectStateBtn setTitle:@"解绑中..." forState:(UIControlStateNormal)];
    [TPSSdk.share unbindDevWithUserId:@"" result:^(NSError *error) {
       
        NSLog(@"解绑操作完成 error = %@", error);
        _connectStateBtn.enabled = error != nil;
        [_connectStateBtn setTitle:error ? @"解绑成功" : @"解绑失败" forState:(UIControlStateNormal)];
    }];
}

- (void)reconnect {
    
    _connectStateBtn.enabled = false;
    [_connectStateBtn setTitle:@"重连中..." forState:(UIControlStateNormal)];
    [TPSSdk.share reconnectLastDevice:^(TPSConnnectResult_State state, TPSConnnectResult_Error_Code errorCode) {
        
        NSLog(@"重连操作完成 state = %d, errorCode = %hhu", state, errorCode);
        if (state == TPSConnnectResult_State_Connected) {
            
            _connectStateBtn.enabled = true;
            _funcationListBtn.enabled = true;
            NSString *title = [NSString stringWithFormat:@"已连接设备%@ 点击解绑", TPSSdk.share.currentDevice.name];
            [_connectStateBtn setTitle:title forState:(UIControlStateNormal)];
        } else {
            
            _connectStateBtn.enabled = false;
            _funcationListBtn.enabled = false;
            [_connectStateBtn setTitle:@"设备重连失败" forState:(UIControlStateNormal)];
        }
    } delegate:TSDeviceManager.share extraParam:[[TPSExtraConnectParam alloc] initWithUserId:@"" gender:(TPSExtraConnectParam_Gender_Male) age:0 height:0 weight:0]];
}

- (void)beginScanDevice {
    
    // 扫描设备，duration为超时时间，为0则不停止一直扫描直到手动停止或执行了其他蓝牙连接事件.
    _funcationListBtn.enabled = false;
    [_connectStateBtn setTitle:@"扫描中... 点击停止" forState:(UIControlStateNormal)];
    self.scanning = true;
    __weak typeof(self) weakSelf = self;
    [TPSSdk.share scanDeviceDuration:0 result:^(TPSDeviceModel *device, BOOL scanEnd) {
        
        // 添加扫描到的新设备
        if (device && [device.mac isKindOfClass:NSString.class] && device.mac.length == 17) {
            
            NSArray *findedDeviceMac = [weakSelf.deviceArray valueForKeyPath:@"mac"];
            if (![findedDeviceMac containsObject:device.mac]) {
                
                [weakSelf.deviceArray addObject:device];
                [weakSelf.deviceTbaleView reloadData];
            }
        }
        
        if (scanEnd) {
            
            weakSelf.scanning = false;
            [_connectStateBtn setTitle:@"点击开始扫描设备" forState:(UIControlStateNormal)];
            _funcationListBtn.enabled = TPSSdk.share.currentDevice;
        }
    }];
}

- (void)connectStateBtnAction {
    
    // 已经连上设备时解绑
    if (TPSSdk.share.currentDevice) {
        
        [self unbindAction];
        return;
    }
    
    // 正在扫描，点击停止扫描
    if (self.scanning) {
        
        [self stopScan];
        return;
    }
    
    [self beginScanDevice];
}

//
- (void)stopScan {
    
    [TPSSdk.share stopScan];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deviceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row < self.deviceArray.count) {
        
        TPSDeviceModel *deviceModel = self.deviceArray[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@      %@", deviceModel.mac, deviceModel.name];
    }
    return cell;
}
@end

