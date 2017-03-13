//
//  CHUserInfo.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHBaseModel.h"

@interface CHUserInfo : CHBaseModel

@property (nonatomic , copy) NSString *nickname;
@property (nonatomic , copy) NSString *phoneNum;
@property (nonatomic , copy) NSString *password;
@property (nonatomic , copy) NSString *iconPath;
@property (nonatomic , copy) NSString *token;


@end


/*
- (void) login {
    [MBProgressHUD ShowProgressDialog:@"正在登录"];
    
    [CHUserCenter loginWithUsername:self.phoneNumTextField.text password:self.passwordTextField.text macAddress:[[UIDevice currentDevice].identifierForVendor UUIDString] deviceSn:@"" complete:^(CHUCResponseInfo *info) {
        if (info.ok) { // login success
            
            // save userToken and userKey
            NSString *mtoken = [info.JSONObject valueForKey:@"token"];
            [IPPSDKConfiger Instance].userToken = mtoken;
            [IPPSDKConfiger Instance].userKey = self.phoneNumTextField.text;
            
            // save user phone and password
            [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumTextField.text forKey:default_username];
            [[NSUserDefaults standardUserDefaults]setObject:self.passwordTextField.text forKey:default_password];
            
            // request user info
            [CHUserCenter getUserInfoWithComplete:^(CHUCResponseInfo *info) {
                if (info.ok) {
                    CHUCUserInfo * userInfo =[CHUCUserInfo userInfoWithJSONObject:info.JSONObject];
                    NSLog(@"获取到 nickname : %@",userInfo.nickName);
                    // save user nickname
                    if (!userInfo.nickName) {
                        userInfo.nickName = [[NSUserDefaults standardUserDefaults]objectForKey:default_username];
                        [CHUserCenter updateUserInfo:userInfo complete:^(CHUCResponseInfo *info) {
                            
                            if (info.ok) {
                                [[NSUserDefaults standardUserDefaults]setObject:userInfo.nickName forKey:default_nickname];
                            }
                            else {
                                
                            }
                        }];
                    }
                    [[NSUserDefaults standardUserDefaults]setObject:userInfo.nickName forKey:default_nickname];
                    
                    // save user icon url
                    if ((userInfo.iconURL)&&(![userInfo.iconURL hasPrefix:@"http://"])) {
                        userInfo.iconURL = [@"http://" stringByAppendingString:userInfo.iconURL];
                    }
                    
                    if (userInfo.iconURL) {
                        [[NSUserDefaults standardUserDefaults]setObject:userInfo.iconURL forKey:default_userPhoto];
                        dispatch_queue_t queue = dispatch_queue_create("requestUserIcon", NULL);
                        dispatch_async(queue, ^{
                            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:userInfo.iconURL]];
                            [[NSUserDefaults standardUserDefaults] setObject:data forKey:default_userPhoto_Data];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        });
                    }
                    else {
                        [self uploadUserDefaultIcon];
                    }
                    
                    // save user id
                    [self requestAndSaveUserIdSuccess:^{
                        [CHSDataHandle initializeAllDevicesSuccess:^{
                            
                            // request hemu cameras
                            [[CHSHeMuDataHandle shareHMDataHandle] hmLoginSuccess:^(CloudUserInfo *userInfo) {
                                
                                [[CHSHeMuDataHandle shareHMDataHandle] hmRequestAllHMCamerasSuccess:^(NSArray<HeMuCameraDevice *> *cameras) {
                                    [CHSTempDataH5 shareTemp].hmCameras = [cameras mutableCopy];
                                    [self goHomeWithCameras:[NSArray new]];
                                    
                                } fail:^(NSString *dialog) {
                                    [MBProgressHUD stopShowProgressAndShowDialog:@"摄像头初始化失败"];
                                }];
                                
                                
                            } fail:^(NSString *dialog) {
                                [MBProgressHUD stopShowProgressAndShowDialog:@"摄像头初始化失败"];
                                [self goHomeWithCameras:[NSArray new]];
                            }];
                        } failed:^(NSString *error) {
                            NSLog(@"login error : %@", error);
                            [MBProgressHUD stopShowProgressAndShowDialog:@"登录失败"];
                            return ;
                        }];
                        
                    } fail:^(NSString *dialog) {
                        [MBProgressHUD stopShowProgressAndShowDialog:dialog];
                        return ;
                    }];
                }
                else { // get user info fail
                    [MBProgressHUD stopShowProgressAndShowDialog:@"获取用户信息失败"];
                }
            }];
        }
        else { // login fail
            [MBProgressHUD stopShowProgressAndShowDialog:@"登录失败"];
        }
    }];
    
}
*/