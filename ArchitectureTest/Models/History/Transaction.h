//
//  CompletePaymentModel.h
//  
//
//  Created by Zhao Fei on 16/6/3.
//  Copyright © 2016年 . All rights reserved.
//

#import "BaseModel.h"

@class PayeeOrPayer;
@class Conversion;
@class CurrencyCNS;
@class Payload;
@class LinkedAccountForHistory;
/**
 *  交易类型
 */
typedef NS_ENUM(NSUInteger, TrasactionType) {
    TrasactionTypePayment_sent,
    TrasactionTypePayment_received,
    TrasactionTypeConversion,
    TrasactionTypeDeposit,
    TrasactionTypeWithdrawal,
};

/*
 Conversion.status = {
 PENDING: 0,
 COMPLETE: 1
 }
 */

/**
 *  交易状态
 */
typedef NS_ENUM(NSUInteger, TransactionStatus) {
    TransactionStatusPending,
    TransactionStatusCancelled,
    TransactionStatusRejected,
    TransactionStatusComplete,
    TransactionStatusProcessing
};

/**
 *  payment类型
 */
typedef NS_ENUM(NSUInteger, PaymentType) {
    PaymentTypeSend = 1,
    PaymentTypeRequest
};

@interface Transaction : BaseModel

@property (nonatomic, copy) NSString *sentTo;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) TrasactionType transactionType;
@property (nonatomic, assign) TransactionStatus status;
@property (nonatomic, assign) id type;

@property (nonatomic, copy) NSString *paymentType; // 1.domestic 2.international

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *availableAt;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *completedAt;

@property (nonatomic, strong) PayeeOrPayer *Payer;
@property (nonatomic, strong) PayeeOrPayer *Payee;


@property (nonatomic, strong) NSNumber *isDirectToBank;

@property (nonatomic, copy) NSString *ConversionId;
@property (nonatomic, strong) Conversion *Conversion;

@property (nonatomic, strong) CurrencyCNS *fromCurrency;
@property (nonatomic, strong) CurrencyCNS *toCurrency;

@property (nonatomic, strong) Payload *payload;


@property (nonatomic, copy) NSString *PayerId;
@property (nonatomic, copy) NSString *PayeeId;

@property (nonatomic, copy) NSString *payerNote;
@property (nonatomic, copy) NSString *payeeNote;

@property (nonatomic, strong) NSNumber *fromAmount;
@property (nonatomic, strong) NSNumber *toAmount;

@property (nonatomic, strong) NSNumber *taxAmount;
@property (nonatomic, strong) NSNumber *feeAmount;
@property (nonatomic, strong) NSNumber *totalKleeringFeeAmount;
@property (nonatomic, strong) NSNumber *totalPaid;
@property (nonatomic, strong) NSNumber *otherFees;
@property (nonatomic, strong) NSNumber *totalReceived;

@property (nonatomic, copy) NSString *fromCurrencyCode;
@property (nonatomic, copy) NSString *toCurrencyCode;

@property (nonatomic, strong) NSNumber *exchangeRate;

/// for deposite/withdrawal  type = "Deposite" , "Withdrawal"
@property (nonatomic, strong) CurrencyCNS *currencyModel;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSNumber *originalAmount;
@property (nonatomic, copy) NSString *currencyCode;
@property (nonatomic, copy) NSString *CurrencyAccountId;
@property (nonatomic, copy) NSString *LinkedAccountId;
@property (nonatomic, copy) NSString *UserId;
@property (nonatomic, strong) LinkedAccountForHistory *LinkedAccount;
/// 提现收取的费用
@property (nonatomic, strong) NSNumber *fee;

/// expand
@property (nonatomic, assign) BOOL isDomestic;
@property (nonatomic, assign) BOOL isNeedSimplifyCreatAtTime;
@end
