//
//  CHHomeViewController.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHHomeViewController.h"
#import "CHUserCloudManager.h"

#import "MBProgressHUD+ChEx.h"

@interface CHHomeViewController ()

@end

@implementation CHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Home";
    
    [self initNavigationBar];
    
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
    [[CHUserCloudManager defaultUCManager] logoutSuccess:^{
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^(NSString *dialog) {
        
    }];
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
