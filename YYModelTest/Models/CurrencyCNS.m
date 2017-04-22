//
//  CurrencyCNS.m
//  
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 . All rights reserved.
//

#import "CurrencyCNS.h"

@implementation CurrencyCNS
+ (instancetype)currencyCodeNameSignModelWithDictionary:(NSDictionary *)dictionary{
    CurrencyCNS *model = [[CurrencyCNS alloc] init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
