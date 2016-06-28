//
//  MS_BasicDataControllerl.h
//  wanzhu
//
//  Created by 古玉彬 on 16/1/15.
//  Copyright © 2016年 msql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MS_BasicDataControllerl : NSObject

/**
 *  成功回调
 *
 *  @param resCallBack <#resCallBack description#>
 */
typedef void (^SuccessBlock)(id  successCallBack);

/**
 *  失败回调
 *
 *  @param resCallBack <#resCallBack description#>
 */
typedef void (^Failure)(NSString * failureCallBack);

/**
 *  系统错误回调
 *
 *  @param error <#error description#>
 */
typedef void (^Error)(NSError * error);


/**
 *  当前用户
 */
//@property (nonatomic, weak)MS_UserModel * user;

/**
 *  带code值的网络请求
 *
 *  @param url         <#url description#>
 *  @param params      <#params description#>
 *  @param show        <#show description#>
 *  @param successResp <#successResp description#>
 *  @param failureResp <#failureResp description#>
 */
- (void)postWithReturnCode:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show success:(void (^)(id res, NSString *code))successResp failure:(void (^)(NSError * error))failureResp;
/**
 *  网络请求
 *
 *  @param url         <#url description#>
 *  @param params      <#params description#>
 *  @param show        <#show description#>
 *  @param successResp 成功回调
 *  @param failureResp 失败回调
 *  @param error       系统异常回调
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show success:(SuccessBlock)successResp failure:(Failure)failureResp ErrorInfo:(Error)errorRes;


/**
 *  上传单个文件
 *
 *  @param url     请求地址
 *  @param params  参数<字典类型>
 *  @param imageData 头像data
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show imageData:(NSData *)imageData success:(SuccessBlock)success failure:(Failure)failure ErrorInfo:(Error)errorRes;

/**
 *  上传多个文件
 *
 *  @param url     请求地址
 *  @param params  参数<字典类型>
 *  @param imageArr 图片数组
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show imageArr:(NSArray *)imageArr success:(SuccessBlock)success failure:(Failure)failure ErrorInfo:(Error)errorRes;


/**
 *   网络是否连接
 */
- (BOOL)isNetWorkConnected;
@end
