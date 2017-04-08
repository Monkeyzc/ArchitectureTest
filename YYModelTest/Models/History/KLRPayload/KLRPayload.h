//
//  KLRPayload.h
//  Melotic
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

@class KLRRecipient;
@interface KLRPayload : BaseModel
@property (nonatomic, strong) KLRRecipient *recipient;
@end
