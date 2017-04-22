//
//  BaseViewController.m
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/8.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "BaseViewController.h"
#import "SVProgressHUD.h"
#import "YTKNetworkAgent.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



/**
 视图即将消失, 取消当前的所有请求
 */
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear and cancel all requests");
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    [[YTKNetworkAgent sharedAgent] cancelAllRequests];
}

@end
