//
//  KLRContactProfile.m
//  Melotic
//
//  Created by Zhao Fei on 16/9/13.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "KLRContactProfile.h"

@implementation KLRContactProfile

+ (NSArray *)modelPropertyBlacklist {
    return @[@"fullNameForDispaly"];
}

- (NSString *)phoneNumberFormatted{
    return _phoneNumberFormatted.length ? _phoneNumberFormatted : _phoneNumber;
}

- (NSString *)fullNameForDispaly {
    if (!_fullNameForDispaly) {
        if (self.firstName.length && self.lastName.length) {
            _fullNameForDispaly = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
        }else if (self.firstName.length) {
            _fullNameForDispaly = self.firstName;
        }else if (self.lastName.length) {
            _fullNameForDispaly = self.lastName;
        }else {
            _fullNameForDispaly = nil;
        }
    }
    return _fullNameForDispaly;
}



@end
