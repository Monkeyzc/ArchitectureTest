//
//  Cache.h
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "YYCache.h"

@interface Cache : YYCache

+ (instancetype)shareInstance;

- (void)cacheData:(id)data withKey:(NSString *)key completeBlock:(void (^)())completeBlock;

- (void)readDataFromCacheWithKey:(NSString *)key completeBlock:(void (^)(id data))completeBlock;

- (void)countAllCacheSizeWithCompleteBlock:(void (^)(NSString *diskSize))completeBlock;
- (void)removeAllCacheWithCompleteBlock:(void (^)())completeBlock;

@end
