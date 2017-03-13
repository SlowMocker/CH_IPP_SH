//
//  CHUserInfo.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHUserInfo.h"

@implementation CHUserInfo

- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"iconURL"]) {
        self.iconPath = value;
    }
    if ([key isEqualToString:@"phone"]) {
        self.phoneNum = value;
    }
    if ([key isEqualToString:@"nickName"]) {
        self.nickname = value;
    }
}

@end
