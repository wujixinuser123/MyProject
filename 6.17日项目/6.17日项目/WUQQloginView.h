//
//  WUQQloginView.h
//  6.17日项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 wu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "UMSocial.h"

typedef void(^loginSuccess)(NSDictionary *returnDict);
typedef void(^loginError)();
@interface WUQQloginView : NSObject
/**get请求*/

+ (void)qqLoginMethod:(loginSuccess)QQloginSuccess
                error:(loginError)QQloginError
              whichVC:(UIViewController*)VC;

@end
