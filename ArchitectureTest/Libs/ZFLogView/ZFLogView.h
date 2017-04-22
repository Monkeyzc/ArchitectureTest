//
//  ViewController.h
//  UIWebViewJSDemo
//
//  Created by zhaofei on 2017/2/25.
//  Copyright © 2017年 zhaofei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFLogView : UIView
@property (nonatomic, strong, readwrite) id params;

+ (void)showLogViewWithParams:(id)params;

@end

@interface ZFBottomNoficationView : UIView
@property (nonatomic, strong, readwrite) id params;
@end

