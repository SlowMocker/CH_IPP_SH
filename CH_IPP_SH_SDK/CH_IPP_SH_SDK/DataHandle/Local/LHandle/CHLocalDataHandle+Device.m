//
//  CHLocalHandle+Device.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalDataHandle+Device.h"

static NSString * const primaryKey = @"devid";

@implementation CHLocalDataHandle (Device)

- (void) localDevice_addIPPDevices:(NSArray<CHIPPDeviceInfo *> *)devices {
    [self.db localAddObjs:devices primaryKey:primaryKey toFilePath:[self localDevice_iPPDeviceStoragePath]];
}

- (NSArray<CHIPPDeviceInfo *> *) localDevice_allIPPDevices {
    return [self.db localAllObjsWithFilePath:[self localDevice_iPPDeviceStoragePath]];
}

- (void) localDevice_clearIPPDevices {
    [self.db localClearObjsWithFilePath:[self localDevice_iPPDeviceStoragePath]];
}

- (void) localDevice_resetIPPDevices:(NSArray<CHIPPDeviceInfo *> *)devices {
    [self localDevice_clearIPPDevices];
    [self localDevice_addIPPDevices:devices];
}

- (NSString *) localDevice_iPPDeviceStoragePath {
    return [NSString stringWithFormat:@"%@%@",CH_DOCUMENT_PATH,@"device.archive"];
}

@end
