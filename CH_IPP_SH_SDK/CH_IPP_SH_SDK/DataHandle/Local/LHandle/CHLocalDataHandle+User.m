//
//  CHLocalHandle+User.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalDataHandle+User.h"
#import "CHConst.h"


@implementation CHLocalDataHandle (User)

- (void) localUser_updateUserInfoWithNickname:(NSString *)nickname {
    if (nickname) {
        [CH_USERDEFAULT setValue:nickname forKey:kUserNickname];
    }
}

- (void) localUser_updateUserInfoWithPassword:(NSString *)password {
    if (password) {
        [CH_USERDEFAULT setValue:password forKey:kPassword];
    }
}

- (void) localUser_updateUserInfoWithIconPath:(NSString *)iconPath {
    if (iconPath) {
        [CH_USERDEFAULT setValue:iconPath forKey:kUserIconPath];
    }
}

- (void) localUser_updateUserInfo:(CHUserInfo *)userInfo {
//    if (userInfo.iconPath) {
//        [CH_USERDEFAULT setValue:userInfo.iconPath forKey:kUserIconPath];
//    }
//    if (userInfo.nickname) {
//        [CH_USERDEFAULT setValue:userInfo.nickname forKey:kUserNickname];
//    }
//    if (userInfo.password) {
//        [CH_USERDEFAULT setValue:userInfo.password forKey:kPassword];
//    }
//    if (userInfo.phoneNum) {
//        [CH_USERDEFAULT setValue:userInfo.phoneNum forKey:kPhoneNum];
//    }
//    if (userInfo.token) {
//        [CH_USERDEFAULT setValue:userInfo.token forKey:kUserCloudToken];
//    }
    [CH_USERDEFAULT setValue:userInfo.iconPath forKey:kUserIconPath];
    [CH_USERDEFAULT setValue:userInfo.nickname forKey:kUserNickname];
    [CH_USERDEFAULT setValue:userInfo.password forKey:kPassword];
    [CH_USERDEFAULT setValue:userInfo.phoneNum forKey:kPhoneNum];
    [CH_USERDEFAULT setValue:userInfo.token forKey:kUserCloudToken];
}

- (void) localUser_clearUserInfo {
    [self localUser_updateUserInfo:nil];
}


@end
