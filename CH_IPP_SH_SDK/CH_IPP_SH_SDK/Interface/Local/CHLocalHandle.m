//
//  CHLocalHandle.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalHandle.h"

@interface CHLocalHandle()



@end

@implementation CHLocalHandle

CH_SINGLETON_M(LocalHandle)

/**
 *  将一类相同类型的设备存储到相应的路径下（增）
 *
 *  @param objs 设备数组
 *  @param path 路径
 */
- (void) localStoreObjs:(NSMutableArray<NSCopying , NSCoding> *)objs toPath:(NSString *)path {
    NSMutableArray *dataArrM = [NSMutableArray new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        dataArrM = [[NSArray arrayWithContentsOfFile:path] mutableCopy];
    }
    for (id<NSCopying , NSCoding> obj in objs) {
        // 序列化对象
        NSMutableData *dataM = [NSMutableData new];
        NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:dataM];
        [archive encodeObject:obj forKey:@"data"];
        [archive finishEncoding];
        // 将对象数据放入数组
        [dataArrM addObject:dataM];
    }
    [[dataArrM copy] writeToFile:path atomically:YES];
}

/**
 *  清空某个文件（删）
 *
 *  @param path 路径
 */
- (void) localClearDataWithPath:(NSString *)path {
    NSMutableArray *dataArrM = [NSMutableArray new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[dataArrM copy] writeToFile:path atomically:YES];
    }
}

/**
 *  获取到某个文件路径里的所有对象（查）
 *
 *  @param path 路径
 *
 *  @return 所有对象
 */
- (NSMutableArray *) localAllObjWithPath:(NSString *)path {
    NSMutableArray *arrM = [NSMutableArray new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        for (NSData *data in [NSArray arrayWithContentsOfFile:path]) {
            NSKeyedUnarchiver *unArchive = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
            id obj = [unArchive decodeObjectForKey:@"data"];
            [unArchive finishDecoding];
            [arrM addObject:obj];
        }
    }
    return arrM;
}



/**
 *  IPP 设备本地存储路径
 *
 *  @return 路径
 */
- (NSString *) localIPPDeviceStorePath {
    return [NSString stringWithFormat:@"%@/%@",CH_DOCUMENT_PATH,@"device.file"];
}




@end
