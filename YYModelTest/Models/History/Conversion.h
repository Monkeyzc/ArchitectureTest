//
//  Conversion.h
//  
//
//  Created by Zhao Fei on 16/4/27.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, ConvsersionStatus) {
    ConvsersionStatusPending,
    ConvsersionStatusComplete
};

@class CurrencyCNS;

@interface Conversion : BaseModel

@property (nonatomic, assign) ConvsersionStatus status;
@property (nonatomic, copy) NSString *UserId;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *exchangeRate;

@property (nonatomic, strong) NSNumber *feeAmount;
@property (nonatomic, assign) NSNumber *fromAmount;
@property (nonatomic, assign) NSNumber *toAmount;

@property (nonatomic, copy) NSString *fromCurrencyCode;
@property (nonatomic, copy) NSString *toCurrencyCode;

@property (nonatomic, strong) CurrencyCNS *fromCurrency;
@property (nonatomic, strong) CurrencyCNS *toCurrency;

@end
