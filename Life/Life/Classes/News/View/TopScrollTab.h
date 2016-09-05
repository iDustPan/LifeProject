//
//  TopScrollTab.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopScrollTabDelegate;

@interface TopScrollTab : UIView

@property (nonatomic, weak) id<TopScrollTabDelegate> tapDelegate;

- (instancetype)initWithTitles:(NSArray *)titles;

@end

@protocol TopScrollTabDelegate <NSObject>

- (void)topScrollTabDidSelectedTitle:(NSString *)title;

@end