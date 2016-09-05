//
//  SpeedyCode.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#ifndef SpeedyCode_h
#define SpeedyCode_h

/**
 * 快速加载图片
 */
#define kImageWithName(Name) ([UIImage imageNamed:Name])
#define kBigImageWithName(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Name ofType:nil]])

/**
 * 快速访问系统自带的singleton
 */
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kNotificationCenter  [NSNotificationCenter defaultCenter]

/**
 * 快速发送通知API
 */
#define kPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]
#define kPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

// empty
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

// 判断对象是否为null
#define kIsNull(obj) ([obj isKindOfClass:[NSNull class]])
// 是否是无效字典
#define kIsInvalidDict(objDict) (objDict == nil || ![objDict isKindOfClass:[NSDictionary class]])
// 是否是无效数组
#define kIsInvalidArray(objArray) (objArray == nil || ![objArray isKindOfClass:[NSArray class]])

// Log
#ifdef DEBUG
#define AppLog(s, ... ) NSLog( @"[%@：in line: %d]-->[message: %@]", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define AppLog(s, ... )
#endif


#endif /* SpeedyCode_h */
