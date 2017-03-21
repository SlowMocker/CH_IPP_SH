//
//  CHLocalHandle+Device.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalDataHandle.h"

#import "CHIPPDeviceInfo.h"

@interface CHLocalDataHandle (Device)

/**
 *  添加存储 IPP 设备
 *
 *  @param devics 设备数组
 */
- (void) localDevice_addIPPDevices:(NSArray<CHIPPDeviceInfo *> *)devices;

/**
 *  获取本地存储的 IPP 设备数组
 *
 *  @return IPP 设备数组
 */
- (NSArray<CHIPPDeviceInfo *> *) localDevice_allIPPDevices;

/**
 *  清空本地存储的 IPP 设备
 */
- (void) localDevice_clearIPPDevices;

/**
 *  重置本地存储的 IPP 设备
 *
 *  @note 每次从网络请求所有 IPP 设备时都应该调用这个方法
 *
 *  @param devics 设备
 */
- (void) localDevice_resetIPPDevices:(NSArray<CHIPPDeviceInfo *> *)devices;

@end
