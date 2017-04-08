//
//  KLRAlertView.m
//  YYModelTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "KLRAlertView.h"

@interface KLRAlertView ()

@end

@implementation KLRAlertView

+ (void)showErrorWithMessage:(NSString *)message {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.showAnimationType =  SCLAlertViewShowAnimationSlideInToCenter;
    [alert showError:message subTitle:nil closeButtonTitle:@"OK" duration:0.0f];
}

+ (void)showSuccessWithMessage:(NSString *)message {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.showAnimationType =  SCLAlertViewShowAnimationSlideInToCenter;
    [alert showSuccess:message subTitle:nil closeButtonTitle:@"Ok" duration:0.0f];
}

+ (void)showSuccessWithMessage:(NSString *)message dismissCompleteBlock: (void (^)())completeBlock {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.showAnimationType =  SCLAlertViewShowAnimationSlideInToCenter;
    [alert showSuccess:message subTitle:nil closeButtonTitle:@"Ok" duration:0.0f];
    [alert alertDismissAnimationIsCompleted:^{
        if (completeBlock) {
            completeBlock();
        }
    }];
}

@end
