//
//  HDFHud.h
//  
//
//  Created by huangyibiao on 15/6/16.
//
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

/**
 * 对应SVProgressHUD的枚举类型SVProgressHUDMaskType
 *
 * @author huangyibiao
 * @see SVProgressHUDMaskType
 */
typedef NS_ENUM(NSInteger, XPSVProgressHUDMaskType) {
    XPSVProgressHUDMaskTypeNone = 1,  // default mask type, allow user interactions while HUD is displayed
    XPProgressHUDMaskTypeClear,     // don't allow user interactions
    XPProgressHUDMaskTypeBlack,     // don't allow user interactions and dim the UI in the back of the HUD, as on iOS 7 and above
    XPProgressHUDMaskTypeGradient,  // don't allow user interactions and dim the UI with a a-la UIAlertView background gradient, as on iOS 6
    XPProgressHUDMaskTypeCustom     // don't allow user interactions and dim the UI in the back of the HUD with a custom color
};

/**
 *  @author Huangyibiao
 *
 *  HUD组件，对加载进度、提示成功、失败等包装
 *
 *  @since v0.1
 */
@interface XPHud : NSObject

#pragma mark - SVProgressHUD加载相关
/**
 * 显示有转圈圈HUD，无文本提示。默认的maskType为HDFSVProgressHUDMaskTypeNone
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)show;

/**
 * 显示有转圈圈HUD，无文本提示，可指定maskType类型
 *
 * @param maskType 掩盖类型
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showWithMaskType:(XPSVProgressHUDMaskType)maskType;

/**
 * 显示有转圈圈HUD，可指定文本。默认的maskType为HDFSVProgressHUDMaskTypeNone
 *
 * @param status 状态文本
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showWithStatus:(NSString *)status;

/**
 * 显示有转圈圈HUD，可指定文本和maskType
 *
 * @param status 状态文本
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showWithStatus:(NSString *)status maskType:(XPSVProgressHUDMaskType)maskType;

/**
 * 显示有进度的转圈圈提示HUD，无文本提示，默认为HDFSVProgressHUDMaskTypeNone
 *
 * @param progress 当前进度
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showProgress:(CGFloat)progress;

/**
 * 显示有进度的转圈圈提示HUD，默认为HDFSVProgressHUDMaskTypeNone
 *
 * @param progress 当前进度
 * @param status 状态提示语
 *
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showProgress:(CGFloat)progress status:(NSString*)status;

/**
 * 显示有进度的转圈圈提示HUD
 *
 * @param progress 当前进度
 * @param status 状态提示语
 * @param maskType 遮盖类型
 * 
 * @see HDFSVProgressHUDMaskType
 */
+ (void)showProgress:(CGFloat)progress
              status:(NSString *)status
            maskType:(XPSVProgressHUDMaskType)maskType;

/**
 * 更换当前HUD的提示文本。一般是在多个请求时，一个请求完成后需要更换新的提示语，此时调用此API更换
 *
 * @param string 状态提示语
 */
+ (void)setStatus:(NSString *)string;

/**
 * 显示成功提示，使用默认的成功图片和指定的状态提示文本
 *
 * @param string 状态提示语
 *
 * @note 若需要修改成功提示图片，可以将SVProgressHUD.bundle中的success图片替换。
 */
+ (void)showSuccessWithStatus:(NSString *)string;

/**
 * 显示失败提示，使用默认的失败图片和指定的状态提示文本
 * 
 * @param string 状态提示语
 * 
 * @note 若需要修改失败提示图片，可以将SVProgressHUD.bundle中的error图片替换。
 */
+ (void)showErrorWithStatus:(NSString *)string;

/**
 * 显示图片和文字的提示，提过完成后会自动消失
 * 
 * @param image 提示的图片
 * @param status 提示的状态文字
 *
 * @note 图片大小请使用28*28px
 */
+ (void)showImage:(UIImage *)image status:(NSString *)status;

/**
 * 如果当前有多个HUD，那么调用此API会使个数减一，若减一后，个数<=0，则会调用dissmiss。
 *
 * @note 此API是比较有用的，对于一个界面有多个请求时，使用此API会更加合适。
 */
+ (void)popActivity;

/**
 * 让HUD消失掉，与show开头的API是成对出现的。
 *
 * @author huangyibiao
 */
+ (void)dismiss;

/**
 * 判断当前是否有HUD正在显示
 *
 * @author huangyibiao
 * @return YES-表示显示中，NO表示已经隐藏
 */
+ (BOOL)isVisible;

/**
 * 只是单纯地显示一行提示语，显示完成后自动消失。注意：没有图片，只是显示文字。
 *
 * @author huangyibiao
 */
+ (void)showTip:(NSString *)tip;

#pragma mark - 下面是对网络请求失败的处理API
/**
 *  @author Huangyibiao
 *
 *  显示网络请求失败提示
 *
 *  @param error 网络请求返回来的NSError对象
 */
+ (void)showNetworkError:(NSError *)error;

/**
 *  @author Huangyibiao
 *
 *  显示网络请求失败提示
 *
 *  @param errorCode 服务器返回的错误码
 */
+ (void)showNetworkErrorWithCode:(NSInteger)errorCode;

@end
