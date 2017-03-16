//
//  CHLocalHandle+User.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalHandle+User.h"
#import "CHConst.h"


@implementation CHLocalHandle (User)

// 修改用户相关信息之后，更新本地存储信息
- (void) localUpdateUserInfoWithNickname:(NSString *)nickname {
    if (nickname) {
        [CH_USERDEFAULT setValue:nickname forKey:kUserNickname];
    }
}

- (void) localUpdateUserInfoWithPassword:(NSString *)password {
    if (password) {
        [CH_USERDEFAULT setValue:password forKey:kPassword];
    }
}

- (void) localUpdateUserInfoWithIconPath:(NSString *)iconPath {
    if (iconPath) {
        [CH_USERDEFAULT setValue:iconPath forKey:kUserIconPath];
    }
}

- (void) localUpdateUserInfo:(CHUserInfo *)userInfo {
    if (userInfo.iconPath) {
        [CH_USERDEFAULT setValue:userInfo.iconPath forKey:kUserIconPath];
    }
    if (userInfo.nickname) {
        [CH_USERDEFAULT setValue:userInfo.nickname forKey:kUserNickname];
    }
    if (userInfo.password) {
        [CH_USERDEFAULT setValue:userInfo.password forKey:kPassword];
    }
    if (userInfo.phoneNum) {
        [CH_USERDEFAULT setValue:userInfo.phoneNum forKey:kPhoneNum];
    }
    if (userInfo.token) {
        [CH_USERDEFAULT setValue:userInfo.token forKey:kUserCloudToken];
    }
}


@end
