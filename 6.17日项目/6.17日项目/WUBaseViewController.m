//
//  WUBaseViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUBaseViewController.h"
static NSString * const BaseURLString = @"http://123.57.141.249:8080/beautalk/";
//static NSString * const BaseURLString = @"http://192.57.141.249:8080/beautalk/";

//实现单例
@implementation AFNetworkingClient
+(instancetype)sharedCilient
{
    static AFNetworkingClient *sharedCilient = nil;
    
    static dispatch_once_t oneToKen;
    dispatch_once (&oneToKen, ^{
       
        sharedCilient = [[AFNetworkingClient alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        sharedCilient.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedCilient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        
    });
    return sharedCilient;
}
@end

@implementation WUBaseViewController

- (void)getDataFromSever:(NSString *)URL parameter:(NSDictionary *)parameter isSuccess:(successBlock)success isError:(errorBlock)errorblock{
    
    [[AFNetworkingClient sharedCilient] GET:URL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            errorblock(task,error);
        }
    }];
    
}
- (void)postDataFromSever:(NSString *)URL parameter:(NSDictionary *)parameter isSuccess:(successBlock)success isError:(errorBlock)errorblock
{
    [[AFNetworkingClient sharedCilient] POST:URL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorblock(task,error);
    }];
}
@end
