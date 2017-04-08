//
//  KLRPayeeModel.m
//  Melotic
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "KLRPayeeOrPayer.h"
#import "KLRContactProfile.h"

@implementation KLRPayeeOrPayer
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"ContactProfiles" : [KLRContactProfile class]};
}

@end
