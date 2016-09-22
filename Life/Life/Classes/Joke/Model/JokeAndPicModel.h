//
//  JokeAndPicModel.h
//  Life
//
//  Created by 徐攀 on 2016/9/22.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JokeModel;

@interface JokeAndPicModel : NSObject

@end


@interface JokeModel : NSObject

/**
 笑话内容
 */
@property (nonatomic, copy) NSString *content;

/**
 更新时间
 */
@property (nonatomic, copy) NSString *updatetime;


/**
 配图地址
 */
@property (nonatomic, copy) NSString *url;
@end
