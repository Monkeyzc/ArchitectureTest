//
//  KLRCurrencyCNS.m
//  Melotic
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "KLRCurrencyCNS.h"

@implementation KLRCurrencyCNS
+ (instancetype)currencyCodeNameSignModelWithDictionary:(NSDictionary *)dictionary{
    KLRCurrencyCNS *model = [[KLRCurrencyCNS alloc] init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
