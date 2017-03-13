//
//  CHNetwork.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CHNetworkEngine : NSObject

/**
 *  POST
 *
 *  @param urlStr  url string
 *  @param dic     param dictionary
 *  @param success success block
 *  @param fail    fail block
 */
+ (void) afRequestDataWithUrlstr:(NSString *)urlStr paramDic:(NSDictionary *)dic success:(void(^)(id respose))success fail:(void(^)(NSString *dialog))fail;

@end
