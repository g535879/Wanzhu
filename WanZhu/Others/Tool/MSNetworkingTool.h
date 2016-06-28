//
//  MSNetworkingTool.h
//  weibu
//
//  Created by lidong on 16/1/8.
//  Copyright © 2016年 msql. All rights reserved.
//

#import <AFNetworking.h>

@interface MSNetworkingTool : NSObject
/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 *  网络是否连接
 *
 *  @return <#return value description#>
 */
+ (BOOL)isNetWorkConnected;
@end