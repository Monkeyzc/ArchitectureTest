//
//  KLRPayeeModel.h
//  Melotic
//
//  Created by Zhao Fei on 16/5/26.
//  Copyright © 2016年 Melotic. All rights reserved.
//

#import "BaseModel.h"

//NOT_SET: 0,
//PENDING_SIGNUP: 1,
//CREATED: 2,
//VERIFIED: 3,
//DISABLED: 4,
//DEACTIVATED: 5
typedef NS_ENUM(NSUInteger, KLRPayeeOrPayerStatus) {
    KLRPayeeOrPayerStatusNOT_SET = 0,
    KLRPayeeOrPayerStatusPENDING_SIGNUP,
    KLRPayeeOrPayerStatusCREATED,
    KLRPayeeOrPayerStatusVERIFIED,
    KLRPayeeOrPayerStatusDISABLED,
    KLRPayeeOrPayerStatusDEACTIVATED,
    KLRPayeeOrPayerStatusIDENTIFIED
};
typedef NS_ENUM(NSUInteger, SentToType) {
    SentToTypeEmail = 1001, // email
    SentToTypePhone,        // phone
    SentToTypeUsername,     // username
    SentToTypeExternal      // bank
};
@class KLRContactModel, KLRContactProfile;
@interface KLRPayeeOrPayer : BaseModel

@property (nonatomic, copy) NSString *sentTo;
@property (nonatomic, assign) SentToType sentToType;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) NSArray <KLRContactProfile *> *ContactProfiles;

@property (nonatomic, copy) NSString *avatarURL;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *phoneCountryCode;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *phoneNumberFormatted;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) KLRPayeeOrPayerStatus status;

@property (nonatomic, assign) BOOL usePin;

@property (nonatomic, copy) NSString *username;

//expand
@property (nonatomic, assign) BOOL isAKleeringUser;
@property (nonatomic, strong) id avatarImage;
@property (nonatomic, strong) id avatarImageForHistory;
@property (nonatomic, strong) KLRContactModel *matchedContact;

@property (nonatomic, copy) NSString *fullNameForDispaly;
@property (nonatomic, copy) NSString *detailForDispaly;
@property (nonatomic, copy) NSString *userCharacteristicForDisplay;

@end
