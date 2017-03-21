//
//  CHLocalDataHandle.m
//  LocalDataBase
//
//  Created by Wu on 17/3/17.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHLocalDataHandle.h"


@interface CHLocalDataHandle()<CHLocalDBConfigurationDelegate>

@end

@implementation CHLocalDataHandle

CH_SINGLETON_M(LDataHandle)

#pragma mark
#pragma mark CHLocalDBConfigurationDelegate
- (NSArray *) mergeRepeatItemWithOldObj:(NSObject *)oldObj newObj:(NSObject *)newObj {
    return @[newObj];
}

- (NSData *) encryptionData:(NSData *)data {
    return data;
}

- (NSData *) decryptionData:(NSData *)data {
    return data;
}

#pragma mark
#pragma mark setters and getters
- (CHLocalDataBase *) db {
    if (!_db) {
        CHLocalDBConfiguration *config = [CHLocalDBConfiguration new];
        config.delegate = self;
        _db = [[CHLocalDataBase alloc]initWithConfiguration:config];
    }
    return _db;
}

@end
