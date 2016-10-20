//
//  XPJokeViewController.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JokeCell;
@class JokeModel;
@interface XPJokeViewController : XPBaseViewController

@property (nonatomic, strong, readonly) UITableView *jokeTableView;

- (JokeCell *)tableViewCellForModel:(JokeModel *)model;

@end
