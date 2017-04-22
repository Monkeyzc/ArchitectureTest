//
//  UrlArgumentsFilter.h
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/8.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"

@interface UrlArgumentsFilter : NSObject <YTKUrlFilterProtocol>
+ (UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end
