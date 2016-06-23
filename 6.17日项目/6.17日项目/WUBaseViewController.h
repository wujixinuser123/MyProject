//
//  WUBaseViewController.h
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

typedef void(^successBlock)(NSURLSessionDataTask *task,id project);
typedef void(^errorBlock)(NSURLSessionDataTask *task,NSError *error);
@interface  AFNetworkingClient : AFHTTPSessionManager
/**
 AFHTTPSessionManager初始化单例

 */
+ (instancetype)sharedCilient;
@end

@interface WUBaseViewController : UIViewController
/**
 AFNetworking进行get请求
 URL:请求地址
 parameter:请求参数
 isSuccess:请求成功返回数据的block
 isError:请求失败返回原因的block
 */
- (void)getDataFromSever:(NSString *)URL
               parameter:(NSDictionary *)parameter
               isSuccess:(successBlock)success
                 isError:(errorBlock)errorblock;

/**
 AFNetworking进行post请求
 URL:请求地址
 parameter:请求参数
 isSuccess:请求成功返回数据的block
 isError:请求失败返回原因的block
 */
- (void)postDataFromSever:(NSString *)URL
               parameter:(NSDictionary *)parameter
               isSuccess:(successBlock)success
                 isError:(errorBlock)errorblock;

/**
 UIView展示提示框
 tostString:要提示的文字
 */

@end
