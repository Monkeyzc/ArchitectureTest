//
//  KLRRequestAccessory.m
//  YYModelTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "KLRRequestAccessory.h"
#import "SVProgressHUD.h"

@interface KLRRequestAccessory()
// 是否需要展示HUD 默认为YES
@property (nonatomic, assign) BOOL isNeedDisplayHUD;
@end

@implementation KLRRequestAccessory

+ (instancetype)createRequestAccessoryWithNeedDisplayHUD: (BOOL)isNeedDisplayHUD {
    KLRRequestAccessory *requestAccessory = [[KLRRequestAccessory alloc] init];
    requestAccessory.isNeedDisplayHUD = isNeedDisplayHUD;
    return requestAccessory;
}

- (void)requestWillStart:(id)request {
    if (self.isNeedDisplayHUD) { // 添加显示 SVProgressHUD
        [SVProgressHUD show];
    } else {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

- (void)requestDidStop:(id)request {
    if (self.isNeedDisplayHUD) { // 添加显示 SVProgressHUD
        [SVProgressHUD dismiss];
    } else {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
    }
}
@end
