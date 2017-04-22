//
//  LinkedAccountDetailsForHistory.h
//  
//
//  Created by Zhao Fei on 16/6/4.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

@interface LinkedAccountDetailsForHistory : BaseModel


/// for bank
@property (nonatomic, copy) NSString *bankName;
@property (nonatomic, copy) NSString *accountNumber;
@property (nonatomic, copy) NSString *beneficiaryName;

@property (nonatomic, copy) NSString *bankNumber;
@property (nonatomic, copy) NSString *branchName;
@property (nonatomic, copy) NSString *branchNumber;

/// for weChat or Alipay
@property (nonatomic, copy) NSString *weChatId;
@property (nonatomic, copy) NSString *aliPayId;

@end
