//
//  NSString+SizeToFit.m
//  newDoctor
//
//  Created by 虔灵 on 15/2/28.
//  Copyright (c) 2015年 haodf.com. All rights reserved.
//

#import "NSString+SizeToFit.h"

@implementation NSString (SizeToFit)

- (CGSize)size2FitWithFont:(UIFont *)font containerWidth:(CGFloat)containerWidth mutableLines:(BOOL)isMutableLines {
    
    CGSize size2Fit;
    
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    size2Fit = [self sizeWithAttributes:attribute];
    
    if ((size2Fit.width > containerWidth && isMutableLines) || ([self containsString:@"\n"] && isMutableLines)) {
        
        size2Fit = [self boundingRectWithSize : CGSizeMake(containerWidth, CGFLOAT_MAX)
                                      options : NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes : attribute
                                      context : nil].size;
        
    }
    
    if (size2Fit.width > containerWidth && isMutableLines == NO) {
        size2Fit.width = containerWidth;
    }
    
    return size2Fit;
}

- (CGSize)size2FitWithFont:(UIFont *)font containerWidth:(CGFloat)containerWidth lineBreakModel:(NSLineBreakMode)lienBreakMode  mutableLines:(BOOL)isMutableLines
{
    CGSize size2Fit;
    
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size2Fit = [self sizeWithAttributes:attribute];
    
    if ((size2Fit.width > containerWidth && isMutableLines) || ([self containsString:@"\n"] && isMutableLines)) {
        
        size2Fit = [self boundingRectWithSize : CGSizeMake(containerWidth, CGFLOAT_MAX)
                                      options : NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes : attribute
                                      context : nil].size;
        
    }
    
    if (size2Fit.width > containerWidth && isMutableLines == NO) {
        size2Fit.width = containerWidth;
    }
    
    
    //  This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
    
    size2Fit.height = ceil(size2Fit.height);
    size2Fit.width = ceil(size2Fit.width);
    
    
    return size2Fit;
}

@end
