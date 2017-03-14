//
//  MBProgressHUD+ChEx.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "MBProgressHUD+ChEx.h"

@implementation MBProgressHUD (ChEx)


+ (void)ShowpureTextDialog:(NSString *)labelText{
    dispatch_async(dispatch_get_main_queue(), ^{
        //        MBProgressHUD *_HUD  = [MBProgressHUD sharedInstanceOther];
        //        _HUD.animationType = MBProgressHUDAnimationZoomIn;
        // 加在当前 controller 的 view 上，可以点击导航栏
        UINavigationController *rootNavc = (UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
        //        [rootNavc.topViewController.view addSubview:_HUD];
        MBProgressHUD *_HUD = [MBProgressHUD showHUDAddedTo:rootNavc.topViewController.view animated:YES];
        _HUD.mode = MBProgressHUDModeCustomView;
        _HUD.label.text = nil;
        _HUD.detailsLabel.text = nil;
        
        if (labelText.length<16) {
            _HUD.label.text = labelText;
            
        } else {
            _HUD.detailsLabel.text = labelText;
        }
        
        [_HUD showAnimated:YES];
        [_HUD hideAnimated:YES afterDelay:2.0];
        _HUD.removeFromSuperViewOnHide = YES;
    });
}

+ (void) chExSaveShowTextDialog:(NSString *)dialog toView:(UIView *)view {
    CH_MAIN_BLOCK(^{
        MBProgressHUD *hud = [MBProgressHUD new];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = dialog;
        hud.removeFromSuperViewOnHide = YES;
        [view addSubview:hud];
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:1.5];
    });
}


@end
