//
//  CHLocalHandle.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHLocalHandle : NSObject

CH_SINGLETON_H(LocalHandle)

/**
 *  将一类相同类型的设备存储到相应的路径下（增）
 *
 *  @param objs 设备数组
 *  @param path 路径
 */
- (void) localStoreObjs:(NSMutableArray<NSCopying , NSCoding> *)objs toPath:(NSString *)path;


/**
 *  清空某个文件（删）
 *
 *  @param path 路径
 */
- (void) localClearDataWithPath:(NSString *)path;



/**
 *  获取到某个文件路径里的所有对象（查）
 *
 *  @param path 路径
 *
 *  @return 所有对象
 */
- (NSMutableArray *) localAllObjWithPath:(NSString *)path;


/**
 *  IPP 设备本地存储路径
 *
 *  @return 路径
 */
- (NSString *) localIPPDeviceStorePath;




@end
