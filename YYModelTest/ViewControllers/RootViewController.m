//
//  RootViewController.m
//  YYModelTest
//
//  Created by zhaofei on 2017/4/8.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "RootViewController.h"
#import "SVProgressHUD.h"
#import "HistoryApi.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    NSLog(@"root---即将展示");
    HistoryApi *api = [HistoryApi createApiWithNeedDisplayHUD: NO];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"history: %@", request.responseObject);
        
        //        NSDictionary *data = [request.responseObject objectForKey:@"data"];
        //        NSDictionary *historyDic = [data objectForKey:@"history"];
        //
        //        KLRHistory *histroy = [KLRHistory createModelWithJson: historyDic];
        //
        //        NSDictionary *jsonObject = [histroy yy_modelToJSONObject];
        //        NSLog(@"%@", jsonObject);
        
        NSLog(@"histroy");
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"request: %@", request.responseJSONObject);
    }];

}
@end
