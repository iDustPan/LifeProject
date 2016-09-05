//
//  XPNet.h
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPResponse.h"
#import <AFNetworking.h>


typedef NS_ENUM(NSUInteger, RequestType) {
    Get = 0,
    Post,
};

typedef void(^SuccessBlock)(XPResponse *reponse);
typedef void(^FailBlock)(NSString *errorMsg, XPResponse *reponse);

@interface XPNet : NSObject
/** 请求最大时间 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/** 响应结果 */
@property (nonatomic, strong) XPResponse *response;

+ (instancetype)sharedNet;

/**
 *  根据一个url取消一个operation
 */
+ (void)cancelOperationsWithURL:(NSURL *)url;

/**
 *  根据一个url的path及fileName取消一个operation,不需要传入完整的url
 *  wangcheng
 */
+ (void)cancelOperationWithAddPathURLString:(NSString *)path;

/*
 *  精确取消操作：当包含containsString时，确定取消
 *  wangcheng
 */
+ (BOOL)cancelOperationWithAddPathURLString:(NSString *)path ContainSString:(NSString *)containsString;

/**
 *  取消所有operations。调用需谨慎，包括下载资源在内的所有网络请求都会取消。
 */
+ (void)cancelAllOperations;
/**
 * 判断是否正在请求这个URL
 *
 */
+  (BOOL)containOperationWithURL:(NSURL *)url;


- (void)requestAtPath:(NSString *)path type:(RequestType)type params:(NSDictionary *)parame success:(SuccessBlock)success failBlock:(FailBlock)fail;

@end
