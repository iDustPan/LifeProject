//
//  DataManager.h
//  Life
//
//  Created by 徐攀 on 16/9/7.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedManager;

- (void)saveData:(id)arr withKey:(NSString *)key;
- (void)loadDataWithKey:(NSString *)key successBlock:(void(^)(id result))success;

@end
