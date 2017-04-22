//
//  History.m
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "History.h"
#import "Transaction.h"

@implementation History
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"complete" : [Transaction class],
             @"pending" : [Transaction class]};
}
@end
