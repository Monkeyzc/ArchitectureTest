//
//  ViewController.m
//  YYModelTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "HistoryApi.h"
#import "YYModel.h"

#import "KLRTransaction.h"
#import "KLRHistory.h"
#import "YTKNetworkAgent.h"

#import "KLRAlertView.h"
#import "YYCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)clickBtn:(id)sender {
    
    NSLog(@"点击按钮的请求");
    
    HistoryApi *api = [HistoryApi createApiWithNeedDisplayHUD: YES];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        [self parseResponseData: request.responseJSONObject];
        
        [KLRAlertView showSuccessWithMessage:@"Success" dismissCompleteBlock:^{
            UIViewController *vc = [UIViewController new];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated: YES];
        }];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"request: %@", request.responseJSONObject);
    }];
}

- (void)parseResponseData: (NSDictionary *)responseData {
    NSDictionary *data = [responseData objectForKey:@"data"];
    NSDictionary *historyDic = [data objectForKey:@"history"];
    KLRHistory *histroy = [KLRHistory createModelWithJson: historyDic];
    NSLog(@"history model: %@", histroy);
}

- (IBAction)cancelRequest:(id)sender {
    NSLog(@"cancel all requests");
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    [[YTKNetworkAgent sharedAgent] cancelAllRequests];
}

@end
