







//
//  WUSingleModel.m
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUSingleModel.h"

@implementation WUSingleModel
+ (instancetype)theSingleTableViewDataSource:(NSDictionary *)dic{
/**
 @property (copy,nonatomic)      NSString *GoodsId;
 @property (copy,nonatomic)      NSString *CountryName;
 @property (copy,nonatomic)      NSString *CountryImg;
 @property (copy,nonatomic)      NSString *ImgView;
 @property (copy,nonatomic)      NSString *BuyCount;
 @property (copy,nonatomic)      NSString *Content;
 @property (copy,nonatomic)      NSString *Discount;
 @property (copy,nonatomic)      NSString *Title;
 @property (copy,nonatomic)      NSString *ForeignPrice;
 @property (copy,nonatomic)      NSString *Price;
 @property (copy,nonatomic)      NSString *OtherPrice;
 @property (copy,nonatomic)      NSString *RestTime;
 */
    WUSingleModel *model = [[WUSingleModel alloc] init];
    model.GoodsId = dic[@"GoodsId"];
    model.CountryName = dic[@"CountryName"];
    model.CountryImg = dic[@"CountryImg"];
    model.ImgView = dic[@"ImgView"];
    model.BuyCount = dic[@"BuyCount"];

    model.Content = dic[@"Content"];
    model.Discount = dic[@"Discount"];
    model.Title = dic[@"Title"];
    model.ForeignPrice = dic[@"ForeignPrice"];
    model.Price = dic[@"Price"];
    model.OtherPrice = dic[@"OtherPrice"];
    model.RestTime = dic[@"RestTime"];
    return model;
}
@end
