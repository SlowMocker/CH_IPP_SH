//
//  MBProgressHUD+ChEx.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/14.
//  Copyright © 2017年 Wu. All rights reserved.
//


// 摘自 MBProgressHUD
/**
 * Displays a simple HUD window containing a progress indicator and two optional labels for short messages.
 *
 * This is a simple drop-in class for displaying a progress HUD view similar to Apple's private UIProgressHUD class.
 * The MBProgressHUD window spans over the entire space given to it by the initWithFrame: constructor and catches all
 * user input on this region, thereby preventing the user operations on components below the view.
 *
 * @note To still allow touches to pass through the HUD, you can set hud.userInteractionEnabled = NO.
 * @attention MBProgressHUD is a UI class and should therefore only be accessed on the main thread.
 */


#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (ChEx)

/**
 *  展示短暂的提示框
 *
 *  @param message 提示语
 *  @param image   提示图片
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowTip:(NSString *)message image:(UIImage *)image toVc:(UIViewController *)vc;

/**
 *  展示带有 indicator 的提示框（需要手动结束）
 *
 *  @param message 提示语
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowWithIndicatorMsg:(NSString *)message toVc:(UIViewController *)vc;

/**
 *  展示没有 indicator 的提示框（需要手动结束）
 *
 *  @param message 提示语
 *  @param vc      用来显示提示的 vc。如果 vc 为 nil 那么将显示在 window 上
 */
+ (void) chExShowMsg:(NSString *)message toVc:(UIViewController *)vc;

/**
 *  移除 vc.view 上的 HUD
 *
 *  @param vc 如果 vc 为 nil ，那么将会移除 window 上的 HUD
 */
+ (void) chExHiddenHUDForVc:(UIViewController *)vc;

@end
