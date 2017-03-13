//
//  CHNetwork.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "CHNetworkEngine.h"

#import <AFNetworking.h>

#import "NSString+ChEx.h"

@implementation CHNetworkEngine

+ (AFHTTPSessionManager *)sharedAFManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 10;
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 设置响应数据的基本了类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", nil];
        // https 参数配置
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
    });
    return manager;
}

+ (void) af_PostRequestWithUrlStr:(NSString *)urlStr paramDic:(NSDictionary *)dic success:(void(^)(id respose))success fail:(void(^)(NSString *dialog))fail {
    // 网络检查
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    if (reachabilityManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        CHLog(@"\n请求网络故障 [业务云]");
        if (fail) {
            fail(@"网络故障");
        }
        return;
    }
    // 处理 url
    NSString *preStr = [NSString chExSaveUrlStrWithString:urlStr];
    // POST
    [[self sharedAFManager] POST:preStr parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        CHLog(@"\n请求到数据 [业务云]:\n%@",responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CHLog(@"\n请求失败 [业务云]:%@",error.localizedDescription);
        if (fail) {
            fail(@"请求数据失败");
        }
    }];
}


@end
