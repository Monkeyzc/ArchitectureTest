//
//  BaseModel.h
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/7.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
+ (instancetype)createModelWithJson: (id)json;
@end
