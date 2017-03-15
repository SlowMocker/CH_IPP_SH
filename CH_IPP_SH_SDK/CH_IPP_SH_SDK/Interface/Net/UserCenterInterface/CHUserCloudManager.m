//
//  CHUserCloudManager.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHUserCloudManager.h"

#import <CHUserCenter/CHUserCenter.h>
#import <UIKit/UIKit.h>

@implementation CHUserCloudManager

CH_SINGLETON_M(UCManager)


- (void) loginWithPhoneNum:(NSString *)phone password:(NSString *)password success:(void(^)(CHUserInfo *userInfo))success fail:(void(^)(NSString *dialog))fail {
    [CHUserCenter loginWithUsername:phone password:password macAddress:nil deviceSn:nil complete:^(CHUCResponseInfo *info) {
        if (info.ok) { // login success
            CHLog(@"登陆成功 [用户云]");
            NSString *token = [info.JSONObject objectForKey:@"token"];
            CHLog(@"返回数据 [用户云]:\n%@",info.JSONObject);
            if (success) {
                [CHUserCenter getUserInfoWithComplete:^(CHUCResponseInfo *info) {
                    if (info.ok) {
                        CHUserInfo *userInfo = [[CHUserInfo alloc]initWithDic:info.JSONObject];
                        userInfo.token = token;
                        userInfo.password = password;
                        CHLog(@"返回数据 [用户云]:\n%@\n转换成 CHUserInfo :\n%@\n\n\n",info.JSONObject,[userInfo toDictionary]);
                        if (!userInfo.nickname) {
                            // 如果用户没有设置 nickname ，默认将电话号码设为 nickname
                            userInfo.nickname = userInfo.phoneNum;
                        }
                        if (success) {
                            success(userInfo);
                        }
                    }
                    else {
                        CHLog(@"获取用户信息失败 [用户云]");
                        if (fail) {
                            fail(@"获取用户信息失败");
                        }
                    }
                }];
            }
        }
        else { // login fail
            CHLog(@"登陆失败 [用户云]: 状态信息(%@)",info.statusInfo);
            if (fail) {
                fail(@"登陆用户云失败");
            }
        }
    }];
}

- (void) logoutSuccess:(void(^)())success fail:(void(^)(NSString *dialog))fail {
    [CHUserCenter logoutWithComplete:^(CHUCResponseInfo *info) {
        if (info.ok) {
            CHLog(@"退出登陆成功 [用户云]");
            if (success) {
                success();
            }
            
        } else {
            CHLog(@"退出登陆失败 [用户云]: %@",info.statusInfo);
            if (fail) {
                fail(@"退出登陆失败");
            }
        }
    }];

}

@end
