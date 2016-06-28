//
//  MSNetworkingTool.m
//  weibu
//
//  Created by lidong on 16/1/8.
//  Copyright © 2016年 msql. All rights reserved.
//

#import "MSNetworkingTool.h"

@implementation MSNetworkingTool


+ (void)load {
    
    //开启网络状态监听
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (BOOL)isNetWorkConnected {
    
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus > 0;
}
@end
