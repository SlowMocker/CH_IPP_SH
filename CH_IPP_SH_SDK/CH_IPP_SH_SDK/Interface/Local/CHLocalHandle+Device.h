//
//  CHLocalHandle+Device.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalHandle.h"

#import "CHIPPDeviceInfo.h"

@interface CHLocalHandle (Device)

/**
 *  存储 IPP 设备
 *
 *  @param devics 设备数组
 */
- (void) localStoreIPPDevices:(NSMutableArray<CHIPPDeviceInfo *> *)devics;

/**
 *  获取本地存储的 IPP 设备数组
 *
 *  @return IPP 设备数组
 */
- (NSMutableArray<CHIPPDeviceInfo *> *) localAllIPPDevices;

/**
 *  清空本地存储的 IPP 设备
 */
- (void) localClearIPPDevices;

/**
 *  重置本地存储的 IPP 设备
 *
 *  @note 每次从网络请求所有 IPP 设备时都应该调用这个方法
 *
 *  @param devics 设备
 */
- (void) localResetIPPDevices:(NSMutableArray<CHIPPDeviceInfo *> *)devics;

@end
