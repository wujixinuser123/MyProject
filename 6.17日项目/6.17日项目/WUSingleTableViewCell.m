//
//  WUSingleTableViewCell.m
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUSingleTableViewCell.h"
@interface WUSingleTableViewCell ()
@property (strong,nonatomic)  UIImageView *contryImage;/**国家image*/
@property (strong,nonatomic)  UIImageView *goodsImage;/**商品image*/
@property (strong,nonatomic)  UILabel *titleLabel;/**海外直邮*/
@property (strong,nonatomic)  UILabel *inForLable;/**商家介绍*/
@property (strong,nonatomic)  UILabel *introduceLable;/**产品介绍*/
@property (strong,nonatomic)  UILabel *priceLable;/**价格*/
@property (strong,nonatomic)  UIImageView *shopingImage;/**购物车image*/

@end
@implementation WUSingleTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.contryImage];
        [self addSubview:self.goodsImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.inForLable];
        [self addSubview:self.introduceLable];
        [self addSubview:self.priceLable];
        [self addSubview:self.shopingImage];

    }
    return self;
}

- (void)setSingleModel:(WUSingleModel *)singleModel
{
    _singleModel = singleModel;
    _contryImage.image = nil;
    _goodsImage.image = nil;
    _titleLabel.text =  singleModel.Title;
    _inForLable.text = singleModel.Discount;
    _introduceLable.text = singleModel.Content;
    _priceLable.text = singleModel.ForeignPrice;
    _shopingImage.image = [UIImage imageNamed:@"限时特卖界面购物车图标"];
}
//将图片请求下来
- (void)layoutSubviews{
    
    WS(weakSelf);
    self.goodsImage.frame = CGRectMake(20, 20, 200, 200);
//    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).offset(40);
//        make.left.equalTo(weakSelf.mas_left).offset(60);
//        make.size.equalTo(CGSizeMake(142, 142));
//        make.size.equalTo(CGSizeMake(142, 142));
//        make.left.equalTo(weakSelf.mas_left).offset(10);
//        make.top.equalTo(weakSelf.mas_top).offset(12);
//    }];

//    [self.contryImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).offset(20);
//        make.left.equalTo(weakSelf.mas_left).offset(15);
//        //        make.size.equalTo(CGSizeMake(20, 20));
//        make.right.equalTo(weakSelf.mas_left).offset(35);
//        make.height.equalTo(20);
//    }];
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
//        make.top.equalTo(weakSelf.mas_top).offset(25);
//        make.right.equalTo(weakSelf.mas_right).offset(-17);
//        make.height.equalTo(15);
//    }];
//    [self.titilLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).offset(25);
//        make.left.equalTo(weakSelf.mas_left).offset(150);
//        make.size.equalTo(CGSizeMake(75, 15));
//    }];
//    [self.inForLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).equalTo(25);
//        make.left.equalTo(weakSelf.titilLable.mas_right).offset(10);
//        make.right.equalTo(weakSelf.mas_right).offset(-15);
//        make.height.equalTo(15);
//    }];
//    [self.introduceLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.titilLable.mas_bottom).offset(10);
//        make.left.equalTo(weakSelf.titilLable.mas_left);
//        make.right.equalTo(weakSelf.mas_right).offset(-15);
//        make.height.equalTo(60);
//    }];
//    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.introduceLable.mas_bottom).offset(25);
//        make.left.equalTo(weakSelf.introduceLable.mas_left);
//        make.size.equalTo(CGSizeMake(100, 20));
//    }];
//    [self.shopingImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(weakSelf.mas_bottom).offset(15);
//        make.right.equalTo(weakSelf.mas_right).offset(40);
//        make.size.equalTo(CGSizeMake(40, 40));
//    }];

}
#pragma mark
#pragma mark 初始化
- (UIImageView *)contryImage
{
    if (!_contryImage) {
        _contryImage = [[UIImageView alloc] init];
    }
    return _contryImage;
}
- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc]init];
    }
    return _goodsImage;
}

- (UIImageView *)shopingImage
{
    if (!_shopingImage) {
        _shopingImage = [[UIImageView alloc] init];
    }
    return _shopingImage;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 4;
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _titleLabel;
}
- (UILabel *)priceLable{
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
    }
    return _priceLable;
}
- (UILabel *)inForLable{
    if (!_inForLable) {
        _inForLable = [[UILabel alloc] init];
    }
    return _inForLable;
}
- (UILabel *)introduceLable{
    if (!_introduceLable) {
        _introduceLable = [[UILabel alloc] init];
        _introduceLable.numberOfLines = 0;
    }
    return _introduceLable;
}

@end
