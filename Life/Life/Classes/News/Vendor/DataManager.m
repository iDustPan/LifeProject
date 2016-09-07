//
//  DataManager.m
//  Life
//
//  Created by 徐攀 on 16/9/7.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype)sharedManager
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)saveData:(id)arr withKey:(NSString *)key
{
    NSString *fileName = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingFormat:@"/%@.json", key];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        BOOL success = [NSKeyedArchiver archiveRootObject:arr toFile:fileName];
        !success ?: AppLog(@"归档成功");
    });
}

- (void)loadDataWithKey:(NSString *)key successBlock:(void (^)(id))success
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingFormat:@"/%@.json", key];
        id result = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
        dispatch_async(dispatch_get_main_queue(), ^{
            !success ?: success(result);
        });
    });
}

@end
