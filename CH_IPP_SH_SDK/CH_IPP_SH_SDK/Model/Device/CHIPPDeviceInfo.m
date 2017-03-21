//
//  CHDeviceInfo.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHIPPDeviceInfo.h"
@interface CHIPPDeviceInfo()

@end

@implementation CHIPPDeviceInfo

- (BOOL) isSelfBinded {
    // 如果是绑定设备，并且不是别人分享的，那么就是自己绑定的
    if (self.isBinded && !(self.sharefrom)) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSArray<NSString *> *) shareToIds {
    NSArray *arr = [NSArray new];
    if (self.shareto) {
        arr = [self.shareto componentsSeparatedByString:@","];
    }
    return arr;
}

@end
