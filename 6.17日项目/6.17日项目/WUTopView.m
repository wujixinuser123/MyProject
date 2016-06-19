//
//  WUTopView.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUTopView.h"

@interface WUTopView ()
@property (strong,nonatomic)    UIButton *loginBtn;
@property (strong,nonatomic)    UIButton *registBtn;
@property (strong,nonatomic)    UIImageView *imageview;
@end
@implementation WUTopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageview];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registBtn];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)ws = self;
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.left.right.equalTo(ws);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(55);
        make.left.equalTo(ws.mas_left).offset(107);
        make.right.equalTo(ws.mas_left).offset(137);
        make.height.equalTo(15);
    }];
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(55);
        make.height.equalTo(15);
        make.left.equalTo(ws.registBtn.mas_left).offset(95);
        make.right.equalTo(ws.mas_right).offset(-107);
    }];
}
- (UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的背景"]];
    
    }
    return _imageview;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.tintColor = [UIColor whiteColor];
//        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        //点击跳转
        [_loginBtn addTarget:self action:@selector(loginTo) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}
//代理的跳转视图方法
- (void)loginTo{
    
    if (self.loginDelegat) {
        [self.loginDelegat jumpToLoginView];
    }
}
- (UIButton *)registBtn
{
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_registBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        _registBtn.tintColor = [UIColor whiteColor];
        [_registBtn addTarget:self action:@selector(registView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}
//代理的跳转视图方法
- (void)registView{
    if (self.loginDelegat) {
        [self.loginDelegat jumpToRegistView];
    }
}

@end
