




//
//  WUQQloginView.m
//  6.17日项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUQQloginView.h"
#import "WUNextView.h"

@implementation WUQQloginView

//get请求

+ (void)qqLoginMethod:(loginSuccess)QQloginSuccess
                error:(loginError)QQloginError
              whichVC:(UIViewController*)VC;
{
    
        //第三方
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
        
        snsPlatform.loginClickHandler(VC,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //          获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
//                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
//                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                if (QQloginSuccess) {
                    QQloginSuccess(dict);
                    
                    //跳转，跳转到手机号绑定页面，获得用户的手机号，将获得到的手机号与第三方登录获得的信息一起传递给服务器
                    //成功之后在这里写上一个网络请求，网络请求的参数就是友盟SDK返回的信息，将这些信息传递给自己的服务器
                }
                else{
                    if (QQloginError) {
                        QQloginError();
                    }
                }
                
            }});
    
}

@end
