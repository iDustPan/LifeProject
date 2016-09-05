//
//  UIView+Frame.h
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/**
 *  返回UIView及其子类的位置和尺寸。分别为左、右边界在X轴方向上的距离，上、下边界在Y轴上的距离，View的宽和高。
 */

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

@property(nonatomic,readonly) CGFloat screenX;
@property(nonatomic,readonly) CGFloat screenY;
@property(nonatomic,readonly) CGFloat screenViewX;
@property(nonatomic,readonly) CGFloat screenViewY;
@property(nonatomic,readonly) CGRect screenFrame;

@property(nonatomic,readonly) CGFloat orientationWidth;
@property(nonatomic,readonly) CGFloat orientationHeight;

- (void)removeSubviews;
- (CGPoint)centerOfFrame;
- (CGPoint)centerOfBounds;
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius color:(UIColor*)color;
- (UIViewController *)currentViewController;
+ (id)viewWithNib;

//在父视图上画一条线
- (void)showLineWithRect:(CGRect)rect inSuperView:(UIView *)superView;

/**
 *  找到第一响应者
 *
 *  @return <#return value description#>
 */
- (UIView *)findFirstResponder;
@end
