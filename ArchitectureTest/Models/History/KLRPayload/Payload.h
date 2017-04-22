//
//  Payload.h
//  
//
//  Created by Zhao Fei on 16/6/2.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

@class Recipient;
@interface Payload : BaseModel
@property (nonatomic, strong) Recipient *recipient;
@end
