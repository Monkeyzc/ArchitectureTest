//
//  CurrencyCNS.h
//  
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyCNS : NSObject

/// CNY, TWD...
@property (nonatomic, copy) NSString *code;
/// fullname in english
@property (nonatomic, copy) NSString *name;
/// ￥, NT$...
@property (nonatomic, copy) NSString *sign;

+ (instancetype)currencyCodeNameSignModelWithDictionary:(NSDictionary *)dictionary;

@end
