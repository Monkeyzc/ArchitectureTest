//
//  KLRAccountDetails.h
//  Melotic
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

@interface KLRAccountDetails : BaseModel

@property (nonatomic, strong) NSString *bankName;
@property (nonatomic, strong) NSString *bankNumber;
@property (nonatomic, strong) NSString *branchName;
@property (nonatomic, strong) NSString *branchNumber;
@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *beneficiaryName;
@end
