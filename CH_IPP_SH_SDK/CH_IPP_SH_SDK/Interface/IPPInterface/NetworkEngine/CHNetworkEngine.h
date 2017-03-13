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
 *  采用 Post 进行网络请求
 *
 *  @param urlStr  请求地址字符串
 *  @param dic     参数字典
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+ (void) af_PostRequestWithUrlStr:(NSString *)urlStr paramDic:(NSDictionary *)dic success:(void(^)(id respose))success fail:(void(^)(NSString *dialog))fail;

@end
