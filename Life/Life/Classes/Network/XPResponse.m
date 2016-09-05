//
//  XPResponse.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "XPResponse.h"

@implementation XPResponse

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (!(self = [super init])) {return nil;}
    
    [self setValuesForKeysWithDictionary:dict];
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


@end
