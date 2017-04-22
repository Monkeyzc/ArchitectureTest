//
//  LinkedAccountForHistory.h
//  
//
//  Created by Zhao Fei on 16/6/4.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, LinkedAccountForHistroyLinkedAccountType) {
    LinkedAccountForHistroyLinkedAccountTypeChineseBank,
    LinkedAccountForHistroyLinkedAccountTypeTaiwanBank,
    LinkedAccountForHistroyLinkedAccountTypeWeChat,
    LinkedAccountForHistroyLinkedAccountTypeAlipay,
    LinkedAccountForHistroyLinkedAccountTypeBitcoin,
    LinkedAccountForHistroyLinkedAccountTypeUSDollarBank,
    LinkedAccountForHistroyLinkedAccountTypeCanadianDollarBank
};

@class LinkedAccountDetailsForHistory;
@interface LinkedAccountForHistory : BaseModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, assign) LinkedAccountForHistroyLinkedAccountType linkedAccountType;

@property (nonatomic, strong) LinkedAccountDetailsForHistory *details;

@end
