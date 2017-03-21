//
//  CHLocalHandle+User.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalDataHandle.h"
#import "CHUserInfo.h"

// 使用 偏好设置 来进行存储

@interface CHLocalDataHandle (User)

/**
 *  更新本地用户 nickname
 */
- (void) localUser_updateUserInfoWithNickname:(NSString *)nickname;
/**
 *  更新本地用户登录密码
 */
- (void) localUser_updateUserInfoWithPassword:(NSString *)password;
/**
 *  更新本地用户头像
 */
- (void) localUser_updateUserInfoWithIconPath:(NSString *)iconPath;
/**
 *  更新本地用户信息
 */
- (void) localUser_updateUserInfo:(CHUserInfo *)userInfo;
/**
 *  清空本地存储用户信息
 */
- (void) localUser_clearUserInfo;

@end
