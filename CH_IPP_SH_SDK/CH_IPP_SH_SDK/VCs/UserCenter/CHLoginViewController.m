//
//  CHLoginViewController.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLoginViewController.h"

#import "CHUserCloudManager.h"

#import "MBProgressHUD+ChEx.h"

#import "CHHomeViewController.h"

@interface CHLoginViewController ()

@end

@implementation CHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Login";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    [MBProgressHUD chExShowMsg:@"登陆中" toVc:self];
    [[CHUserCloudManager defaultUCManager] remoteLoginWithPhoneNum:@"15208260885" password:@"123456789." success:^(CHUserInfo *userInfo) {
        [MBProgressHUD chExHiddenHUDForVc:self];
        [self goHome];
    } fail:^(NSString *dialog) {
        [MBProgressHUD chExHiddenHUDForVc:self];
        [MBProgressHUD chExShowTip:@"登陆失败" image:nil toVc:self];
    }];
}

- (void) goHome {
    CHHomeViewController *homeVc = [[CHHomeViewController alloc]initWithNibName:@"CHHomeViewController" bundle:nil];
    [self.navigationController pushViewController:homeVc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
