//
//  KLRCompletePaymentModel.m
//  Melotic
//
//  Created by Zhao Fei on 16/6/3.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "KLRTransaction.h"

@implementation KLRTransaction

// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
+ (NSArray *)modelPropertyBlacklist {
    return @[@"isDomestic", @"isNeedSimplifyCreatAtTime"];
}
@end
