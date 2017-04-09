//
//  KLRCache.m
//  ArchitectureTest
//
//  Created by zhaofei on 2017/4/9.
//  Copyright © 2017年 zbull. All rights reserved.
//

#import "KLRCache.h"

@implementation KLRCache

+ (instancetype)shareInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *projectName = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleDisplayName"];
        instance = [[self alloc] initWithName: [NSString stringWithFormat:@"%@%@", projectName, @"Cache"]];
    });
    return instance;
}

- (void)cacheData:(id)data withKey:(NSString *)key completeBlock:(void (^)())completeBlock {
    [self setObject:data forKey:key withBlock:^{
        if (completeBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
               completeBlock();
            });
        }
    }];
}

- (void)readDataFromCacheWithKey:(NSString *)key completeBlock:(void (^)(id data))completeBlock {
    [self objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        if (completeBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(object);
            });
        }
    }];
}

- (void)countAllCacheSizeWithCompleteBlock:(void (^)(NSString *))completeBlock {
    // 总大小
    unsigned long long diskCache = [self.diskCache totalCost];
    
    NSString *sizeText = nil;
    
    if (diskCache >= pow(10, 9)) {
        // size >= 1GB
        sizeText = [NSString stringWithFormat:@"%.2fGB", diskCache / pow(10, 9)];
    } else if (diskCache >= pow(10, 6)) { // 1GB > size >= 1MB
        sizeText = [NSString stringWithFormat:@"%.2fMB", diskCache / pow(10, 6)];
    } else if (diskCache >= pow(10, 3)) { // 1MB > size >= 1KB
        sizeText = [NSString stringWithFormat:@"%.2fKB", diskCache / pow(10, 3)];
    } else { // 1KB > size
        sizeText = [NSString stringWithFormat:@"%zdB", diskCache];
    }
    
    if (completeBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(sizeText);
        });
    }
}

- (void)removeAllCacheWithCompleteBlock:(void (^)())completeBlock {
    [self.diskCache removeAllObjectsWithBlock:^{
        if (completeBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock();
            });
        }
    }];
}


@end
