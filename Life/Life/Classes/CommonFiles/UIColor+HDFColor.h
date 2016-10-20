//
//  UIColor+HDFColor.h
//  newPatient
//
//  Created by huangyibiao on 15/6/3.
//  Copyright (c) 2015年 haodf.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIColor常用扩展方法
 */
@interface UIColor (HDFColor)

@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property (nonatomic, readonly) BOOL canProvideRGBComponents;
@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat white;
@property (nonatomic, readonly) CGFloat alpha;

/**
 *  <#Description#>
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  创建指定颜色，尺寸的image
 *
 *  @param color 颜色
 *  @param size  尺寸
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  Create a color from a given color with alpha
 *
 *  @param color UIColor value
 *  @param alpha Alpha value
 *
 *  @return Return the UIColor instance
 */

+ (UIColor *)colorWithColor:(UIColor *)color
                      alpha:(float)alpha;

/**
 *  Create a color from a HEX string
 *
 *  @param hexString HEX string, eg: #ffffff
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;

/**
 *  Create a color from HEX
 *
 *  @param hex HEX value
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithHex:(unsigned int)hex;

/**
 *  Create a color from HEX with alpha
 *
 *  @param hex   HEX value
 *  @param alpha Alpha value
 *
 *  @return Return the UIColor instance
 */
+ (id)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

@end
