//
//  ViewController.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "ViewController.h"

#import "CHUserCloudManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[CHUserCloudManager defaultUCManager] loginWithPhoneNum:@"15208260885" password:@"123456789." success:^(CHUserInfo *userInfo) {
        
    } fail:^(NSString *dialog) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
