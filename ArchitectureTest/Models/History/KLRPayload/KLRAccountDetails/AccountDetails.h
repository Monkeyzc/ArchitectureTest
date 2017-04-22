//
//  AccountDetails.h
//  
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

@interface AccountDetails : BaseModel

@property (nonatomic, strong) NSString *bankName;
@property (nonatomic, strong) NSString *bankNumber;
@property (nonatomic, strong) NSString *branchName;
@property (nonatomic, strong) NSString *branchNumber;
@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *beneficiaryName;
@end
