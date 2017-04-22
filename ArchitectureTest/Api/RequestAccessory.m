//
//  RequestAccessory.m
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "RequestAccessory.h"
#import "SVProgressHUD.h"

@interface RequestAccessory()
// 是否需要展示HUD 默认为YES
@property (nonatomic, assign) BOOL isNeedDisplayHUD;
@end

@implementation RequestAccessory

+ (instancetype)createRequestAccessoryWithNeedDisplayHUD: (BOOL)isNeedDisplayHUD {
    RequestAccessory *requestAccessory = [[RequestAccessory alloc] init];
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
