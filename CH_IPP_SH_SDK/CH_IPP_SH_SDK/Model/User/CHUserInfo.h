//
//  CHUserInfo.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/13.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHBaseModel.h"

@interface CHUserInfo : CHBaseModel

@property (nonatomic , copy) NSString *nickname;
@property (nonatomic , copy) NSString *phoneNum;
@property (nonatomic , copy) NSString *password;
@property (nonatomic , copy) NSString *iconPath;
@property (nonatomic , copy) NSString *token;


@end
