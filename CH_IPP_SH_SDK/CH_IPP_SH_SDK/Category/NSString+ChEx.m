//
//  NSString+ChEx.m
//  IPPSmartManager
//
//  Created by Wu on 17/3/10.
//  Copyright © 2017年 Changhong electric Co.,Ltd. All rights reserved.
//

#import "NSString+ChEx.h"

@implementation NSString (ChEx)

+ (NSURL *) chExSaveUrlWithString:(NSString *)str {
    NSURL *url;
    // pre progress
    str = [self chExSaveUrlStrWithString:str];
    // assert
    NSString *error = [NSString stringWithFormat:@"返回的 URL 为 nil : 目标 str = %@",str];
    NSAssert(url, error);
    return url;
}

+ (NSString *) chExSaveUrlStrWithString:(NSString *)str {
    // replace space
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    // encode
    NSCharacterSet *urlAllowChars = [NSCharacterSet URLQueryAllowedCharacterSet];
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:urlAllowChars];
    
    return str;
}

@end
