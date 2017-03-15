//
//  MBProgressHUD+ChEx.m
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//

#import "MBProgressHUD+ChEx.h"


static NSString *const kHudMagin = @"10";
static NSString *const kHudShowTimerval = @"1.5";
static NSString *const kHudFontSize = @"15";


#define HUD_FRAME CGRectMake(0, 128, CH_SCREEN_WIDTH, CH_SCREEN_HEIGHT - 128)

@implementation MBProgressHUD (ChEx)

/**
 *  展示短暂的提示框
 *
 *  @param message 提示语
 *  @param image   提示图片
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowTip:(NSString *)message image:(UIImage *)image toVc:(UIViewController *)vc {
    CH_MAIN_BLOCK(^{
        MBProgressHUD *hud;
        if (vc.view) {
            hud = [[MBProgressHUD alloc]initWithView:vc.view];
            [vc.view addSubview:hud];
            if (vc.edgesForExtendedLayout == 0) {
                hud.offset = CGPointMake(0, -32);
            }
        }
        else {
            hud  = [[MBProgressHUD alloc] initWithFrame:HUD_FRAME];
            [[self lastWindow] addSubview:hud];
            hud.offset = CGPointMake(0, -64);
        }
        hud.mode = MBProgressHUDModeCustomView;
        [self styleWithHUD:hud];
        if (image) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
            hud.customView = imageView;
        }
        if (message) {
            hud.label.font = [UIFont systemFontOfSize:kHudFontSize.integerValue];
            hud.label.text = message;
        }
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:kHudShowTimerval.floatValue];
    });
}

/**
 *  展示带有 indicator 的提示框（需要手动结束）
 *
 *  @param message 提示语
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowWithIndicatorMsg:(NSString *)message toVc:(UIViewController *)vc {
    [self chExShowHUDWithMsg:message toVc:vc mode:MBProgressHUDModeIndeterminate];
}
/**
 *  展示没有 indicator 的提示框（需要手动结束）
 *
 *  @param message 提示语
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowMsg:(NSString *)message toVc:(UIViewController *)vc {
    [self chExShowHUDWithMsg:message toVc:vc mode:MBProgressHUDModeCustomView];
}

+ (void) chExShowHUDWithMsg:(NSString *)message toVc:(UIViewController *)vc mode:(MBProgressHUDMode)mode {
    CH_MAIN_BLOCK(^{
        MBProgressHUD *hud;
        if (vc.view) {
            hud = [[MBProgressHUD alloc]initWithView:vc.view];
            [vc.view addSubview:hud];
            if (vc.edgesForExtendedLayout == 0) {
                hud.offset = CGPointMake(0, -32);
            }
        }
        else {
            hud = [[MBProgressHUD alloc] initWithFrame:HUD_FRAME];
            [[self lastWindow] addSubview:hud];
            hud.offset = CGPointMake(0, -64);
        }
        hud.mode = mode;
        [self styleWithHUD:hud];
        if (message) hud.label.text = message;
        [hud showAnimated:YES];
    });
}

+ (void) chExHiddenHUDForVc:(UIViewController *)vc {
    CH_MAIN_BLOCK(^{
        if (vc.view)
            [self hideHUDForView:vc.view animated:YES];
        else
            [self hideHUDForView:[self lastWindow] animated:YES];
    });
}

#pragma mark
#pragma mark pravite method

+ (void) styleWithHUD:(MBProgressHUD *)hud {
    hud.margin = kHudMagin.integerValue;
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    hud.removeFromSuperViewOnHide = YES;
}

+ (UIView *) lastWindow {
    return [[UIApplication sharedApplication].windows lastObject];
}


@end
