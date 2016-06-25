//
//  WUBtnView.m
//  6.17日项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUBtnView.h"
@implementation WUBtnView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.sinilBtn];
        [self addSubview:self.groupBtn];
    }
    return  self;
}
- (void)layoutSubviews
{
    WS(weakSelf);
    [self.sinilBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.width.equalTo(weakSelf.frame.size.width/2);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    [self.groupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.sinilBtn.mas_right);
        make.width.equalTo(weakSelf.frame.size.width/2);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];

}
- (UIButton *)sinilBtn{
    if (!_sinilBtn) {
        _sinilBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sinilBtn setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
        [_sinilBtn setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateSelected];
        [_sinilBtn setTitle:@"新品团购" forState:UIControlStateNormal];
        
        [_sinilBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_sinilBtn setTitleColor:RGB(67, 182, 241) forState:UIControlStateNormal];
        [_sinilBtn setTitleColor:RGB(239, 101, 48) forState:UIControlStateSelected];
        _sinilBtn.selected = YES;
    }
    return _sinilBtn;
}
- (UIButton *)groupBtn
{
    if (!_groupBtn) {
        _groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_groupBtn setTitle:@"品牌团购" forState:UIControlStateNormal];
        [_groupBtn setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_groupBtn setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateSelected];
        
        [_groupBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_groupBtn setTitleColor:RGB(67, 182, 241) forState:UIControlStateNormal];
        [_groupBtn setTitleColor:RGB(239, 101, 48) forState:UIControlStateSelected];

    }
    return _groupBtn;
}
@end
