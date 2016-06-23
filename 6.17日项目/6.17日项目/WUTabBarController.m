//
//  WUTabBarController.m
//  6.16项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 wu. All /Users/mac/Desktop/6.16项目/6.16项目/WUList.plistrights reserved.
//

#import "WUTabBarController.h"
#import "WUNavigationController.h"
@interface WUTabBarController ()
@property (strong,nonatomic)    NSArray *array;
@end

@implementation WUTabBarController

- (NSArray *)array
{
    if (!_array) {
        _array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WUList" ofType:@"plist"]];
        
    }
    return _array;
}

- (void)viewDidLoad{
    NSMutableArray *mut = [[NSMutableArray alloc] initWithCapacity:self.array.count];
    
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        Class VClass = NSClassFromString(dict[@"viewController"]);
        UIViewController *viewController = [[VClass alloc] init];
        viewController.title = dict[@"title"];
        
        [viewController.tabBarItem setImage:[[UIImage imageNamed:dict[@"imge"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewController.tabBarItem setSelectedImage:[[UIImage imageNamed:dict[@"selectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewController.tabBarItem setTitleTextAttributes:@{
                                                            NSForegroundColorAttributeName:[UIColor grayColor],
                                                            NSFontAttributeName:[UIFont systemFontOfSize:10]
                                                            }forState:(UIControlStateNormal)];
        [viewController.tabBarItem setTitleTextAttributes:@{
                                                            NSForegroundColorAttributeName:[UIColor colorWithRed:0.0 green:240/255.0 blue:1.0 alpha:1.0],
                                                            NSFontAttributeName:[UIFont systemFontOfSize:10]
                                                            }forState:(UIControlStateSelected)];
        
        WUNavigationController *nav = [[WUNavigationController alloc] initWithRootViewController:viewController];
        [mut addObject:nav];
    }];
    
    self.viewControllers = mut;
    self.selectedIndex = 0;
}
@end
