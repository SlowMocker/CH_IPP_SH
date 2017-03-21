//
//  CHDeviceCloudInterface.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHIPPDeviceInfo.h"

@interface CHDeviceCloudManager : NSObject

CH_SINGLETON_H(DCManager)


#pragma mark
#pragma mark sync interface
/**
 *  获取所有数据并通知设备云更新云端数据
 *
 *  @return 所有 IPP 设备
 */
- (NSMutableArray<CHIPPDeviceInfo *> *) remoteGetAllIPPDevices;




#pragma mark
#pragma mark async interface

@end
