//
//  WUSingleModel.h
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUSingleModel : NSObject
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


+ (instancetype)theSingleTableViewDataSource:(NSDictionary *)dic;
@end
