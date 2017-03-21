//
//  CHDeviceCloudInterface.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHDeviceCloudManager.h"

#import <IPP3/IPP3.h>



@implementation CHDeviceCloudManager

CH_SINGLETON_M(DCManager)

/**
 *  获取所有数据并通知设备云更新云端数据
 *
 *  @return 所有 IPP 设备
 */
- (NSMutableArray<CHIPPDeviceInfo *> *) remoteGetAllIPPDevices {
    NSMutableArray<CHIPPDeviceInfo *> *arrM = [NSMutableArray new];
    
    // 获取设备列表（包括绑定的设备列表（在线or离线），本地的设备列表（绑定or未绑定））
    // getAllDeviceList 会通知 IPP 设备云更新云端数据
    NSArray<IPPDeviceModel*> *devics = [[IPPControl Instance] getAllDeviceList];
    for (IPPDeviceModel *model in devics) {
        NSDictionary *dic = [model getDictionary];
        CHIPPDeviceInfo *deviceInfo = [[CHIPPDeviceInfo alloc]initWithDic:dic];
        [arrM addObject:deviceInfo];
    }
    
    return arrM;
}

@end
