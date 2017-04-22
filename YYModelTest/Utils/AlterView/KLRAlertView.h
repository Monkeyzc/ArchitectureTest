//
//  KLRAlertView.h
//  YYModelTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "SCLAlertView.h"

@interface KLRAlertView : SCLAlertView

+ (void)showErrorWithMessage:(NSString *)message;
+ (void)showErrorWithMessage:(NSString *)message dismissCompleteBlock: (void (^)())completeBlock;
+ (void)showSuccessWithMessage:(NSString *)message;
+ (void)showSuccessWithMessage:(NSString *)message dismissCompleteBlock: (void (^)())completeBlock;
@end
