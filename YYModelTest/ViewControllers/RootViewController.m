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
#import "KLRCache.h"
@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cacheSizeLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[KLRCache shareInstance] countAllCacheSizeWithCompleteBlock:^(NSString *diskSize) {
        self.cacheSizeLabel.text = diskSize;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    NSLog(@"root---即将展示");
    HistoryApi *api = [HistoryApi createApiWithNeedDisplayHUD: NO];
//    api.params = @{@"name": @"zhaofei"};
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        [[KLRCache shareInstance] countAllCacheSizeWithCompleteBlock:^(NSString *diskSize) {
            self.cacheSizeLabel.text = diskSize;
        }];

    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"request: %@", request.responseJSONObject);
    }];

}

- (IBAction)clickRemoveCacheBtn:(id)sender {
    [SVProgressHUD show];
    [[KLRCache shareInstance] removeAllCacheWithCompleteBlock:^{
        [SVProgressHUD dismiss];
        self.cacheSizeLabel.text = @"0 B";
    }];
}
@end
