//
//  WUNavigationController.m
//  6.16项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUNavigationController.h"

@implementation WUNavigationController

+ (void)initialize
{
    
    UINavigationBar *nav = [[UINavigationBar alloc] init];
    
    [nav setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:(UIBarMetricsDefault)];
    [nav setTitleTextAttributes:@{
                                  NSFontAttributeName:[UIFont systemFontOfSize:17.0],
                                  NSForegroundColorAttributeName:[UIColor colorWithRed:141/255.0 green:89/255.0 blue:189/255.0 alpha:1.0]
                                  
                                  }];
    
}

@end
