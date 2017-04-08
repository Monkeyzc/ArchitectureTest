//
//  KLRConversion.h
//  Melotic
//
//  Created by Zhao Fei on 16/4/27.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, KLRConvsersionStatus) {
    KLRConvsersionStatusPending,
    KLRConvsersionStatusComplete
};

@class KLRCurrencyCNS;

@interface KLRConversion : BaseModel

@property (nonatomic, assign) KLRConvsersionStatus status;
@property (nonatomic, copy) NSString *UserId;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *exchangeRate;

@property (nonatomic, strong) NSNumber *feeAmount;
@property (nonatomic, assign) NSNumber *fromAmount;
@property (nonatomic, assign) NSNumber *toAmount;

@property (nonatomic, copy) NSString *fromCurrencyCode;
@property (nonatomic, copy) NSString *toCurrencyCode;

@property (nonatomic, strong) KLRCurrencyCNS *fromCurrency;
@property (nonatomic, strong) KLRCurrencyCNS *toCurrency;

@end
