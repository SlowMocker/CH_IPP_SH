//
//  CHUserCloudManager.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "CHUserInfo.h"

@interface CHUserCloudManager : NSObject

CH_SINGLETON_H(UCManager)

/**
 *  登陆长虹用户云
 *
 *  @param phone    电话号码
 *  @param password 密码
 *  @param success  成功回调
 *  @param fail     失败回调
 */
- (void) remoteLoginWithPhoneNum:(NSString *)phone password:(NSString *)password success:(void(^)(CHUserInfo *userInfo))success fail:(void(^)(NSString *dialog))fail;

/**
 *  退出长虹用户云
 *
 *  @param success 成功回调
 *  @param fail    失败回调
 */
- (void) remoteLogoutSuccess:(void(^)())success fail:(void(^)(NSString *dialog))fail;

@end
