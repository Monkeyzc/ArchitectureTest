//
//  Request.m
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/8.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "Request.h"

#import "AlertView.h"
#import "RequestAccessory.h"
#import "Cache.h"
#import "ZFLogView.h"

@interface Request()
@property (nonatomic, strong, readwrite) NSArray *requestMethods;
@end

@implementation Request

+ (instancetype)createApiWithNeedDisplayHUD: (BOOL)isNeedDisplayHUD {
    Request *request = [[self alloc] init];
    
    //默认添加数据缓存, YYCache
    request.cache = YES;
    
    // 添加请求的附件, 指示网络正在进行
    [request addAccessory:[RequestAccessory createRequestAccessoryWithNeedDisplayHUD: isNeedDisplayHUD]];
    return request;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    /*
        如果api 请求 有额外的 headers, 可以在此处添加
    */
    return nil;
}

- (id)requestArgument {
    return self.params;
}

- (void)requestCompleteFilter {
    if (self.cache) {
        [[Cache shareInstance] cacheData:self.responseJSONObject withKey:NSStringFromClass([self class]) completeBlock:^{
            NSLog(@"请求:%@, url:%@ 缓存完成", NSStringFromClass([self class]), self.requestUrl);
        }];
    }
}

- (void)requestFailedFilter {
    // 请求失败的过滤处理
    
    /*
        1. self.responseStatusCode 状态码, 可以根据 是否为503/0 来判断是否服务器是否还存活, 如果服务器挂掉, 可以发送通知给导航栏, 显示网络错误
        2. self.responseJSONObject 获取失败的信息
     */
    
    NSLog(@"%@", self.responseJSONObject);
    
    NSMutableDictionary *logViewparams = [NSMutableDictionary dictionary];
    
    [logViewparams setObject: self.requestUrl ? self.requestUrl : [NSNull null] forKey: @"url"];
    [logViewparams setObject:  self.requestMethods[self.requestMethod] forKey: @"requestMethod"];
    [logViewparams setObject:  [self requestHeaderFieldValueDictionary] ? [self requestHeaderFieldValueDictionary] : [NSNull null] forKey: @"requestHeaders"];
    [logViewparams setObject:  self.requestArgument ? self.requestArgument : [NSNull null] forKey: @"requestArgument"];
    [logViewparams setObject:  self.responseJSONObject ? self.responseJSONObject : [NSNull null] forKey: @"responseJSONObject"];
    
    if (self.responseJSONObject == nil || self.responseStatusCode == 0 || self.responseStatusCode == 503) {
        NSLog(@"服务器挂掉了!😓");
        [AlertView showErrorWithMessage:@"Something wrong with network, please check it" dismissCompleteBlock:^{
            // show request log only for develop
            [ZFLogView showLogViewWithParams: logViewparams];
        }];
    } else {
        [AlertView showErrorWithMessage:[self getErrorMessage] dismissCompleteBlock:^{
            // show request log only for develop
            [ZFLogView showLogViewWithParams: logViewparams];
        }];
    }
}

- (NSString *)getErrorMessage {
    return [self.responseJSONObject objectForKey:@"message"];
}

- (NSArray *)requestMethods {
    if (!_requestMethods) {
        _requestMethods = @[@"GET", @"POST", @"HEAD", @"PUT", @"DELETE", @"PATCH"];
    }
    return _requestMethods;
}

@end
