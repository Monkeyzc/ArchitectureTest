//
//  KLRRecipent.h
//  Melotic
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"
@class KLRAccountDetails;

@interface KLRRecipent : BaseModel
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *phoneCountryCode;
@property (nonatomic, strong) KLRAccountDetails *accountDetails;
@end
