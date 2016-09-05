//
//  NSString+SizeToFit.h
//  newDoctor
//
//  Created by 虔灵 on 15/2/28.
//  Copyright (c) 2015年 haodf.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SizeToFit)

/**
 *  字符串自适应高度
 *
 *  @param font           设定的font
 *  @param containerWidth 固定长度
 *  @param isMutableLines 是否有line
 *
 *  @return 自适应后的size
 */
- (CGSize)size2FitWithFont:(UIFont *)font containerWidth:(CGFloat)containerWidth mutableLines:(BOOL)isMutableLines;

- (CGSize)size2FitWithFont:(UIFont *)font containerWidth:(CGFloat)containerWidth lineBreakModel:(NSLineBreakMode)lienBreakMode  mutableLines:(BOOL)isMutableLines;
@end