//
//  HDFHud.m
//  
//
//  Created by huangyibiao on 15/6/16.
//
//

#import "XPHud.h"

@implementation XPHud

#pragma mark - SVProgressHUD加载相关
+ (void)show {

    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD show];
}

+ (void)showWithMaskType:(XPSVProgressHUDMaskType)maskType {
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD show];
}

+ (void)showWithStatus:(NSString *)status {
  [SVProgressHUD showWithStatus:status];
}

+ (void)showWithStatus:(NSString *)status maskType:(XPSVProgressHUDMaskType)maskType {
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD showWithStatus:status];
}

+ (void)showProgress:(CGFloat)progress {
  [SVProgressHUD showProgress:progress];
}

+ (void)showProgress:(CGFloat)progress status:(NSString *)status {
  [SVProgressHUD showProgress:progress status:status];
}

+ (void)showProgress:(CGFloat)progress
              status:(NSString *)status
            maskType:(XPSVProgressHUDMaskType)maskType {
    [SVProgressHUD setDefaultMaskType:maskType];
    [SVProgressHUD showProgress:progress status:status];
}

+ (void)setStatus:(NSString *)string {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD setStatus:string];
    } else {
        [self showWithStatus:string maskType:XPProgressHUDMaskTypeClear];
    }
}

+ (void)showSuccessWithStatus:(NSString *)string {
  [SVProgressHUD showSuccessWithStatus:string];
}

+ (void)showErrorWithStatus:(NSString *)string {
  [SVProgressHUD showErrorWithStatus:string];
}

+ (void)showImage:(UIImage *)image status:(NSString *)status {
  [SVProgressHUD dismiss];
  [SVProgressHUD showImage:image status:status];
}

+ (void)popActivity {
  [SVProgressHUD popActivity];
}

+ (void)dismiss {
  [SVProgressHUD dismiss];
}

+ (BOOL)isVisible {
  return [SVProgressHUD isVisible];
}

+ (void)showTip:(NSString *)tip {
  [self showImage:nil status:tip];
}

#pragma mark - 下面是对网络请求失败的处理API
+ (void)showNetworkError:(NSError *)error {
  NSLog(@"此API未实现，需要明确服务器中定义的错误码才能实现");
}

+ (void)showNetworkErrorWithCode:(NSInteger)errorCode {
  NSLog(@"此API未实现，需要明确服务器中定义的错误码才能实现");
}

@end
