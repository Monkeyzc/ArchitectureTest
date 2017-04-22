//
//  CompletePaymentModel.m
//  
//
//  Created by Zhao Fei on 16/6/3.
//  Copyright © 2016年 . All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
+ (NSArray *)modelPropertyBlacklist {
    return @[@"isDomestic", @"isNeedSimplifyCreatAtTime"];
}
@end
