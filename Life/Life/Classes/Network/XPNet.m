//
//  XPNet.m
//  Life
//
//  Created by 徐攀 on 16/9/5.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#define kLifeBaseURL [NSURL URLWithString:@"http://v.juhe.cn"]

#import "XPNet.h"

@interface XPNet ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation XPNet


+ (instancetype)sharedNet
{
    static XPNet *net;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        net = [XPNet new];
    });
    return net;
}

- (void)requestAtPath:(NSString *)path type:(RequestType)type params:(NSDictionary *)parame success:(SuccessBlock)success failBlock:(FailBlock)fail
{
    switch (type) {
        case Get:
            [self.manager GET:path parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            break;
        case Post:
            [self.manager POST:path parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            break;
        default:
            break;
    }
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kLifeBaseURL];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    }
    return _manager;
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval
{
    _timeoutInterval = timeoutInterval;
    self.manager.requestSerializer.timeoutInterval = timeoutInterval;
}

+ (void)cancelAllOperations
{
    for (NSURLSessionDataTask *task in [XPNet sharedNet].manager.tasks) {
        [task cancel];
    }
}

+ (void)cancelOperationsWithURL:(NSURL *)url
{
    for (NSURLSessionTask *task in [XPNet sharedNet].manager.tasks) {
        if ([task.originalRequest.URL.absoluteString containsString:url.absoluteString]) {
            [task cancel];
        }
    }
}

+ (void)cancelOperationWithAddPathURLString:(NSString *)path
{
    NSString *urlString = [kLifeBaseURL.absoluteString stringByAppendingString:path];
    [self cancelOperationsWithURL:[NSURL URLWithString:urlString]];
}

+ (BOOL)cancelOperationWithAddPathURLString:(NSString *)path ContainSString:(NSString *)containsString
{
    BOOL isCancelSuccess = NO;
    
    for (NSURLSessionTask *task in [XPNet sharedNet].manager.tasks) {
        if ([task.originalRequest.URL.absoluteString containsString:path]
            && [task.originalRequest.URL.absoluteString containsString:containsString]) {
            [task cancel];
            isCancelSuccess = YES;
        }
    }
    return isCancelSuccess;
}

+ (BOOL)containOperationWithURL:(NSURL *)url
{
    BOOL contain = NO;
    for (NSURLSessionDataTask *task in [XPNet sharedNet].manager.tasks) {
        if ([task.originalRequest.URL.absoluteString containsString:url.absoluteString]) {
            contain = YES;
        }
    }
    return contain;
}



@end
