//
//  CHHomeViewController.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//


// 本类
#import "CHHomeViewController.h"
// 数据类
#import "CHUserCloudManager.h"
#import "CHLocalDataHandle+Device.h"
// 依赖类
#import "CHIPPDeviceInfo.h"
// 扩展
#import "MBProgressHUD+ChEx.h"
// 三方库
#import <IPP3/IPP3.h>



@interface CHHomeViewController ()<IPPControlDelegate>

@end

@implementation CHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Home";
    
    [self initNavigationBar];
    [IPPControl Instance].delegate = self;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSArray<CHIPPDeviceInfo *> *ippDevices = [[CHLocalDataHandle defaultLDataHandle] localDevice_allIPPDevices];
    for (CHIPPDeviceInfo *dev in ippDevices) {
        NSLog(@"%@",[dev toDictionary]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initNavigationBar {
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    leftBarButtonItem.image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *spaceL = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceL.width = -10; // 向左缩进 10 个点
    self.navigationItem.leftBarButtonItems = @[spaceL , leftBarButtonItem];
}

- (void) back {
    NSLog(@"back");
    [MBProgressHUD chExShowMsg:@"退出中" toVc:nil];
    [[CHUserCloudManager defaultUCManager] remoteLogoutSuccess:^{
        [MBProgressHUD chExHiddenHUDForVc:nil];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^(NSString *dialog) {
        [MBProgressHUD chExHiddenHUDForVc:nil];
        [MBProgressHUD chExShowTip:@"退出失败" image:nil toVc:nil];
    }];
}

#pragma mark
#pragma mark delegate
// IPPControlDelegate
- (void) IppEvent:(IPPEvent *)event {
    
}


#pragma mark
#pragma mark private methods





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
