//
//  KLRContactProfile.h
//  Melotic
//
//  Created by Zhao Fei on 16/9/13.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

@interface KLRContactProfile : BaseModel

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phoneCountryCode;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *phoneNumberFormatted;

// expand
@property (nonatomic, copy) NSString *fullNameForDispaly;
@end
