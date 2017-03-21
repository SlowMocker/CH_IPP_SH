//
//  CHLocalDataHandle.h
//  LocalDataBase
//
//  Created by Wu on 17/3/17.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHLocalDataBase.h"

@interface CHLocalDataHandle : NSObject

CH_SINGLETON_H(LDataHandle)

@property (nonatomic , strong) CHLocalDataBase *db;

@end
