//
//  KLRHistory.h
//  YYModelTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "BaseModel.h"
@class KLRTransaction;

@interface KLRHistory : BaseModel
@property (nonatomic, copy, readwrite) NSArray <KLRTransaction *> *complete;
@property (nonatomic, copy, readwrite) NSArray <KLRTransaction *> *pending;

@end
