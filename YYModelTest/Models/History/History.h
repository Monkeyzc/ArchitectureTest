//
//  History.h
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "BaseModel.h"
@class Transaction;

@interface History : BaseModel
@property (nonatomic, copy, readwrite) NSArray <Transaction *> *complete;
@property (nonatomic, copy, readwrite) NSArray <Transaction *> *pending;

@end
