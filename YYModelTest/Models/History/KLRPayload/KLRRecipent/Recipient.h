//
//  Recipent.h
//  
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"
@class AccountDetails;

@interface Recipent : BaseModel
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *phoneCountryCode;
@property (nonatomic, strong) AccountDetails *accountDetails;
@end
