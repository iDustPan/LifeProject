//
//  XPResponse.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XPResponse : NSObject

@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSNumber *error_code;
@property (nonatomic, strong) NSDictionary *result;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
