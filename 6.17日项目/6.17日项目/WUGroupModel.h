//
//  WUModel.h
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUGroupModel : NSObject
@property (copy,nonatomic)      NSString *ImgView;
@property (copy,nonatomic)      NSString *ActivityId;
@property (copy,nonatomic)      NSString *IfMiddlePage;
@property (copy,nonatomic)      NSString *LogoImg;
@property (copy,nonatomic)      NSString *ShopTitle;
@property (copy,nonatomic)      NSString *Content;
@property (copy,nonatomic)      NSString *ActivityDate;

+ (instancetype)theGroupTableViewDataSource:(NSDictionary *)dic;
@end
