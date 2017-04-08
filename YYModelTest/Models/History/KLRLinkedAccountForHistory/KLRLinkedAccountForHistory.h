//
//  KLRLinkedAccountForHistory.h
//  Melotic
//
//  Created by Zhao Fei on 16/6/4.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, KLRLinkedAccountForHistroyLinkedAccountType) {
    KLRLinkedAccountForHistroyLinkedAccountTypeChineseBank,
    KLRLinkedAccountForHistroyLinkedAccountTypeTaiwanBank,
    KLRLinkedAccountForHistroyLinkedAccountTypeWeChat,
    KLRLinkedAccountForHistroyLinkedAccountTypeAlipay,
    KLRLinkedAccountForHistroyLinkedAccountTypeBitcoin,
    KLRLinkedAccountForHistroyLinkedAccountTypeUSDollarBank,
    KLRLinkedAccountForHistroyLinkedAccountTypeCanadianDollarBank
};

@class KLRLinkedAccountDetailsForHistory;
@interface KLRLinkedAccountForHistory : BaseModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, assign) KLRLinkedAccountForHistroyLinkedAccountType linkedAccountType;

@property (nonatomic, strong) KLRLinkedAccountDetailsForHistory *details;

@end
