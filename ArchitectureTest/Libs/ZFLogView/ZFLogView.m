//
//  ViewController.m
//  UIWebViewJSDemo
//
//  Created by zhaofei on 2017/2/25.
//  Copyright © 2017年 zhaofei. All rights reserved.
//

#import "ZFLogView.h"

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ZFLogView () <UIWebViewDelegate>
@property (nonatomic, strong, readwrite) UIWebView *webView;
@end

@implementation ZFLogView

+ (void)showLogViewWithParams:(id)params {
    UIWindow *keyWindow =  [UIApplication sharedApplication].keyWindow;
    
    // display bottom notification view
    ZFBottomNoficationView *bottomNotificationView = [[ZFBottomNoficationView alloc] init];
    bottomNotificationView.params = params;
    bottomNotificationView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 64);
    [keyWindow addSubview: bottomNotificationView];
    
    [UIView animateWithDuration: 0.3 animations:^{
        bottomNotificationView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64, [UIScreen mainScreen].bounds.size.width, 64);
    } completion:^(BOOL finished) {
        
    }];
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:248 / 255.0 blue:227 / 255.0 alpha:1];
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        // navigation bar
        UIView *navigationBar = [[UIView alloc] init];
        navigationBar.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44);
        navigationBar.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:249 / 255.0 blue:249 / 255.0 alpha:1];
        [self addSubview: navigationBar];
        
        UIButton *closeBtn = [[UIButton alloc] init];
        closeBtn.frame = CGRectMake(12, 0, 80, 44);
        [closeBtn setTitle: @"Close" forState: UIControlStateNormal];
        [closeBtn setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
        [closeBtn addTarget: self action: @selector(close) forControlEvents: UIControlEventTouchUpInside];
        [navigationBar addSubview: closeBtn];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 0, 140, 44);
        titleLabel.center = CGPointMake(navigationBar.bounds.size.width * 0.5, navigationBar.bounds.size.height * 0.5);
        titleLabel.text = @"Error information";
        [navigationBar addSubview: titleLabel];
        
        // webView
        self.webView = [[UIWebView alloc] init];
        self.webView.frame = CGRectMake(0, 64, self.bounds.size.width, self.bounds.size.height - 64);
        [self addSubview:self.webView];
        
        self.webView.backgroundColor = [UIColor blackColor];
        self.webView.delegate = self;
        
        // load local html file
        NSString *htmlFilePath = [[NSBundle mainBundle] pathForResource:@"index.html" ofType: nil];
        NSData *htmlFileData = [NSData dataWithContentsOfFile:htmlFilePath];
        NSString *htmlFileString = [[NSString alloc] initWithData:htmlFileData encoding: NSUTF8StringEncoding];
        [self.webView loadHTMLString: htmlFileString baseURL: [[NSURL alloc] initWithString: htmlFilePath]];
    }
    return self;
}

#pragma mark - webView delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"log view did start load");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"log view did finish load");
    // json -> string
    NSData *data = [NSJSONSerialization dataWithJSONObject: self.params options: NSJSONWritingPrettyPrinted error:nil];
    NSMutableString *string = [[NSMutableString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSString *script = [NSString stringWithFormat: @"displayFormatterJson(`%@`)", string];
    [self.webView stringByEvaluatingJavaScriptFromString: script];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"log view did fail load with error: %@", error);
}

- (void)close {
    [UIView animateWithDuration: 0.5 animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.bounds.size.width, self.bounds.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end


@interface ZFBottomNoficationView()

@end

@implementation ZFBottomNoficationView
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:248 / 255.0 blue:227 / 255.0 alpha:1];
        
        [self configureUI];
        
        //Gesture Recognizers
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(tapToDimissAndShowLogView)];
        [self addGestureRecognizer: tap];
        
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeToDismiss)];
        swipe.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer: swipe];
    }
    return self;
}

- (void)tapToDimissAndShowLogView {
    [UIView animateWithDuration: 0.3 animations:^{
       self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 64);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self showLogView];
    }];
}

- (void)swipeToDismiss {
    [UIView animateWithDuration: 0.3 animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 64);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showLogView {
    UIWindow *keyWindow =  [UIApplication sharedApplication].keyWindow;
    ZFLogView *logView = [[ZFLogView alloc] init];
    logView.params = self.params;
    [keyWindow addSubview: logView];
    
    [UIView animateWithDuration: 0.3 animations:^{
        logView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)configureUI {
    UIImageView *reminderImageView = [[UIImageView alloc] init];
    reminderImageView.frame = CGRectMake(12, 12, 44, 44);
    reminderImageView.image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"warning.png" ofType:nil]];
    [self addSubview: reminderImageView];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = [UIColor colorWithRed:139 / 255.0 green:110 / 255.0 blue:60 / 255.0 alpha:1];
    textLabel.numberOfLines = 0;
    textLabel.frame = CGRectMake(CGRectGetMaxX(reminderImageView.frame) + 4, 12, [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(reminderImageView.frame) - 8 , 44);
    textLabel.text = @"Warning! You receive a network error, click to show more information.";
    [self addSubview: textLabel];
}
@end
