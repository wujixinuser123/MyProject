//
//  WUBaseView.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUBaseView.h"

@interface WUBaseView ()
@property (strong,nonatomic)    UILabel *fristlable;
@property (strong,nonatomic)    UIImageView *imageView;
@property (strong,nonatomic)    UILabel *numberLable;

@end
@implementation WUBaseView
 -(instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.fristlable];
        [self addSubview:self.imageView];
        [self addSubview:self.numberLable];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak typeof(self)ws = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(11);
        make.height.equalTo(20);
        make.left.equalTo(ws.mas_left).offset(15);
        make.right.equalTo(ws.mas_left).offset(35);
    }];
    [self.fristlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imageView.mas_right).offset(15);
        make.right.equalTo(ws.imageView.mas_right).offset(83);
        make.top.equalTo(ws.mas_top).offset(13);
        make.height.equalTo(17);
    }];
    [self.numberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(13);
        make.height.equalTo(17);
        make.right.equalTo(ws.mas_right).offset(-15);
    
    }];
}
- (UILabel *)fristlable
{
    if (!_fristlable) {
        _fristlable = [[UILabel alloc] init];
        _fristlable.text = @"客服热线";
        
    }
    return _fristlable;
}
- (UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc] init];
        _numberLable.text = @"400-6010-545";
        _numberLable.textColor = [UIColor grayColor];
    }
    return _numberLable;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"我的界面客服热线图标"];
    }
    return _imageView;
}
@end
