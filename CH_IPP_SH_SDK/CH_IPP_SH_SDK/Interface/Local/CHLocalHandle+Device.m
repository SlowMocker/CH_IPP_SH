//
//  CHLocalHandle+Device.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalHandle+Device.h"



@implementation CHLocalHandle (Device)

/**
 *  存储 IPP 设备
 *
 *  @param devics 设备数组
 */
- (void) localStoreIPPDevices:(NSMutableArray<CHIPPDeviceInfo *> *)devics {
    [self localStoreObjs:[[self localSelfCheckWithIPPDevices:devics] mutableCopy] toPath:[self localIPPDeviceStorePath]];
}

/**
 *  获取本地存储的 IPP 设备数组
 *
 *  @return IPP 设备数组
 */
- (NSMutableArray<CHIPPDeviceInfo *> *) localAllIPPDevices {
    return [[self localSelfCheckWithIPPDevices:[self localAllObjWithPath:[self localIPPDeviceStorePath]]] mutableCopy];
}

/**
 *  清空本地存储的 IPP 设备
 */
- (void) localClearIPPDevices {
    [self localClearDataWithPath:[self localIPPDeviceStorePath]];
}

/**
 *  重置本地存储的 IPP 设备
 *
 *  @note 每次从网络请求所有 IPP 设备时都应该调用这个方法
 *
 *  @param devics 设备
 */
- (void) localResetIPPDevices:(NSMutableArray<CHIPPDeviceInfo *> *)devics {
    [self localClearIPPDevices];
    [self localStoreIPPDevices:devics];
}

/**
 *  剔除数组中的相同元素
 *
 *  @note 检查本地有没有存储相同的设备
 *
 *  @param devices 本地设备
 *
 *  @return 自检后的本地设备
 */
- (NSArray<CHIPPDeviceInfo *> *) localSelfCheckWithIPPDevices:(NSArray<CHIPPDeviceInfo *> *)devices {
    NSMutableArray *arrM = [NSMutableArray arrayWithArray:devices];

    NSMutableArray *arrM2 = [NSMutableArray arrayWithArray:devices];
    for (CHIPPDeviceInfo *ippDevice in devices) {
        [arrM2 removeObject:ippDevice];
        for (CHIPPDeviceInfo *ippDev in [arrM2 copy]) {
            if ([ippDev.devid isEqualToString:ippDevice.devid]) {
                [arrM2 removeObject:ippDev];
                [arrM removeObject:ippDev];
            }
        }
    }
    
    return [arrM copy];
}




@end
