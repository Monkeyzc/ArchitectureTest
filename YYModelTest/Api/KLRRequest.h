//
//  KLRRequest.h
//  YYModelTest
//
//  Created by zhaofei on 2017/4/8.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "YTKRequest.h"

@interface KLRRequest : YTKRequest <YTKRequestAccessory>

/**
 
 request: 一般讲重要的信息, 例如access_token, userId放在 headers filed 中
 
 
 var reponse = {
    status: 'success' / 'error',    // 响应的状态成功或则失败
    message: 'some error message' , // 响应的简要信息, 一般用在失败的原因
    data: {                         // 响应的数据
        json
    }
 }
 */

+ (instancetype)createApiWithNeedDisplayHUD: (BOOL)isNeedDisplayHUD;
@end
