//
//  MS_BasicDataControllerl.m
//  wanzhu
//
//  Created by 古玉彬 on 16/1/15.
//  Copyright © 2016年 msql. All rights reserved.
//

#import "MS_BasicDataControllerl.h"
#import "MSNetworkingTool.h"

//请求头
#define MS_RH \
success:(SuccessBlock)successCallBack failure:(Failure)failureCallBack error:(Error)errorCallback\


//返回体
#define MS_RF \
success:^(id success) {\
if (successCallBack) {\
successCallBack(success);\
}\
} failure:^(NSString *failure) {\
\
if (failureCallBack) {\
\
failureCallBack(failure);\
}\
} ErrorInfo:^(NSError *error) {\
MSLog(@"%@",error);\
\
if (errorCallback) {\
\
errorCallback(error);\
}\
}\


@interface MS_BasicDataControllerl()
@end


@implementation MS_BasicDataControllerl


- (void)postWithReturnCode:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show success:(void (^)(id res, NSString *code))successResp failure:(void (^)(NSError *error))failureResp {
    //拼接网络地址
    NSString * absoluteUrl = [NSString stringWithFormat:@"%@%@",BASE_IP,url];
    
    if (show) {
        
        [SVProgressHUD showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeBlack];
    }
    
    [MSNetworkingTool postWithURL:absoluteUrl params:params success:^(id json) {
        
        if (successResp) {
            if (show) {
                
                [SVProgressHUD dismiss];
            }
            
            successResp(json[@"resobj"],json[@"code"]);
        }
        
    } failure:^(NSError *error) {
        
        if (failureResp) {
            if (show) {
                [SVProgressHUD dismiss];
            }
            
            failureResp(error);
            
            
        }
    }];
}



- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show success:(SuccessBlock)successResp failure:(Failure)failureResp ErrorInfo:(Error)errorRes {

    //拼接网络地址
    NSString * absoluteUrl = [NSString stringWithFormat:@"%@%@",BASE_IP,url];
    
    if (show) {
        
        [SVProgressHUD showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeBlack];
    }
    
    [MSNetworkingTool postWithURL:absoluteUrl params:params success:^(id json) {
        if (show) {
            [SVProgressHUD dismiss];
        }
        
        
        if ([json[@"code"] isEqualToString:@"40000"]) {
            if (successResp) {
                
                successResp(json[@"resobj"]);
            }
        }
        else{
            
            if (failureResp) {
                
                failureResp(json[@"info"]);
            }
        }
        
        
        
    } failure:^(NSError *error) {
        
        if (errorRes) {
            MSLog(@"%@",error);
            if (show) {
                [SVProgressHUD dismiss];
            }
            errorRes(error);
        }
    }];
}

/**
 *  上传单个文件
 *
 *  @param url       文件路径
 *  @param params    参数
 *  @param show      是否显示菊花
 *  @param imageData 二进制文件
 *  @param success   成功的回调
 *  @param failure   失败的回调
 *  @param errorRes  错误的回到
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show imageData:(NSData *)imageData success:(SuccessBlock)success failure:(Failure)failure ErrorInfo:(Error)errorRes{
    //拼接网络地址
    NSString * absoluteUrl = [NSString stringWithFormat:@"%@%@",BASE_IP,url];
    
    if (show) {
        
        [SVProgressHUD showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeBlack];
    }

    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:absoluteUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:@"upload" fileName:@"icon.jpg" mimeType:@"MultipartFile"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable json) {
        
        if (show) {
            [SVProgressHUD dismiss];
        }
        
        if ([json[@"code"] isEqualToString:@"40000"]) {
            if (success) {
                
                success(json[@"resobj"]);
            }
        }
        else{
            
            if (failure) {
                
                failure(json[@"info"]);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorRes) {
            
            if (show) {
                [SVProgressHUD dismiss];
            }
            
            errorRes(error);
        }
        
    }];


}
/**
 *  上传多张图片
 *
 *  @param url      文件路径
 *  @param params   参数
 *  @param show     是否显示菊花
 *  @param imageArr 文件数组
 *  @param success  成功的回调
 *  @param failure  失败的回调
 *  @param errorRes 错误的回调
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params showProgressView:(BOOL)show imageArr:(NSArray *)imageArr success:(SuccessBlock)success failure:(Failure)failure ErrorInfo:(Error)errorRes{

    //拼接网络地址
    NSString * absoluteUrl = [NSString stringWithFormat:@"%@%@",BASE_IP,url];
    
    if (show) {
        
        [SVProgressHUD showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeBlack];
    }
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:absoluteUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (imageArr.count) {
            int i=0;
            
            for (UIImage *image in imageArr) {
                
                [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.2) name:@"img[]" fileName:[NSString stringWithFormat:@"img%d.jpg", i] mimeType:@"MultipartFile"];
                
                i++;
                
            }
            
            
        }
        
    

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable json) {
        
        [SVProgressHUD dismiss];
        
        if ([json[@"code"] isEqualToString:@"40000"]) {
            if (success) {
                
                success(json[@"resobj"]);
            }
        }
        else{
            
            if (failure) {
                
                failure(json[@"info"]);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorRes) {
            [SVProgressHUD dismiss];
            errorRes(error);
        }
        
    }];

}

- (BOOL)isNetWorkConnected {
    
    return [MSNetworkingTool isNetWorkConnected];
}

#pragma mark - getter and setter

//- (MS_UserModel *)user {
//    
//    if (!_user) {
//        
//        _user = [MS_UserModel shareInstance];
//    }
//    return _user;
//}

@end
