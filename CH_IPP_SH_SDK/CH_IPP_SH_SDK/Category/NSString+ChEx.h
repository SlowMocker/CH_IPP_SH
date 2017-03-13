//
//  NSString+ChEx.h
//  IPPSmartManager
//
//  Created by Wu on 17/3/10.
//  Copyright © 2017年 Changhong electric Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChEx)

/**
 *  处理 str ，将其安全转换为 url
 */
+ (NSURL *) chExSaveUrlWithString:(NSString *)str;
/**
 *  对 url str 做预处理
 */
+ (NSString *) chExSaveUrlStrWithString:(NSString *)str;

@end
