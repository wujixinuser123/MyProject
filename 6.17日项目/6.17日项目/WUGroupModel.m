
//
//  WUModel.m
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUGroupModel.h"

@implementation WUGroupModel
+ (instancetype)theGroupTableViewDataSource:(NSDictionary *)dic{
    WUGroupModel *model = [[WUGroupModel alloc] init];
    model.ImgView = dic[@"ImgView"];
    model.ActivityId = dic[@"ActivityId"];
    model.IfMiddlePage = dic[@"IfMiddlePage"];
    model.LogoImg = dic[@"LogoImg"];
    model.ShopTitle = dic[@"ShopTitle"];
    model.Content = dic[@"Content"];
    model.ActivityDate = dic[@"ActivityDate"];

    return model;
}
//- (instancetype)theGroupTableViewDataSource:(NSDictionary *)dic
//{
//    [self setValuesForKeysWithDictionary:dic];
//    return self;
//}
@end
