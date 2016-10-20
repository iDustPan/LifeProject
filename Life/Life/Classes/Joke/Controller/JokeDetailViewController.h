//
//  JokeDetailViewController.h
//  Life
//
//  Created by 徐攀 on 2016/9/22.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPBaseViewController.h"
#import "JokeAndPicModel.h"

@interface JokeDetailViewController : XPBaseViewController

- (instancetype)initWithJokeModel:(JokeModel *)model;

@property (nonatomic, strong, readonly) JokeModel *jokeModel;

@property (nonatomic, strong, readonly) UIImageView *picView;

@end
