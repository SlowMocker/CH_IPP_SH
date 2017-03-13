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
            CHUserInfo *userInfo = [[CHUserInfo alloc]initWithDic:info.JSONObject];
            CHLog(@"返回数据 [用户云]:\n%@\n转换成 CHUserInfo :\n%@\n\n\n",info.JSONObject,[userInfo toDictionary]);
            if (success) {
                success(userInfo);
            }
        }
        else { // login fail
            if (fail) {
                CHLog(@"登陆失败 [用户云]");
                fail(@"登陆用户云失败");
            }
        }
    }];
}

@end
