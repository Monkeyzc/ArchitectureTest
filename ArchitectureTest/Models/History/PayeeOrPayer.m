//
//  PayeeModel.m
//  
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 . All rights reserved.
//

#import "PayeeOrPayer.h"
#import "ContactProfile.h"

@implementation PayeeOrPayer
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"ContactProfiles" : [ContactProfile class]};
}

@end
