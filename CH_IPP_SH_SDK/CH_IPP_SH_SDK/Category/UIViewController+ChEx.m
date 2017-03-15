//
//  UIViewController+ChEx.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "UIViewController+ChEx.h"

#import <objc/runtime.h>

@implementation UIViewController (ChEx)

+ (void)load {
    static dispatch_once_t onceToken1;
    dispatch_once(&onceToken1, ^{
        Class class = [self class];
        
        SEL originalSel = @selector(viewDidLoad);
        SEL newSel = @selector(chs_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class, originalSel);
        Method newMethod = class_getInstanceMethod(class, newSel);
        method_exchangeImplementations(originalMethod, newMethod);
    });
}

// 默认所有的视图从导航栏下开始布局
- (void) chs_viewDidLoad {
    [self chs_viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


@end
