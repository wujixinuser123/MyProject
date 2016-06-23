//
//  WUNextView.m
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUNextView.h"

@interface WUNextView ()
@property (strong,nonatomic)    UILabel *lineLable;
@property (strong,nonatomic)    UILabel *midllLable;
@property (strong,nonatomic)    UIButton *qqBtn;
@property (strong,nonatomic)    UIButton *weChatBtn;
@property (strong,nonatomic)    UIButton *webBtn;

@end
@implementation WUNextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLable];
        [self addSubview:self.midllLable];
        [self addSubview:self.qqBtn];
        [self addSubview:self.weChatBtn];
        [self addSubview:self.webBtn];
    }
    return self;
}
-(void)layoutSubviews
{
   
    __weak typeof(self)ws = self;
    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(15);
        make.right.equalTo(ws.mas_right).offset(-15);
        make.top.equalTo(ws.mas_top).offset(8);
        make.height.equalTo(1);
    }];

    [self.midllLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws);
        make.left.equalTo(ws.mas_left).offset(100);
        make.right.equalTo(ws.mas_right).offset(-100);
        make.height.equalTo(16);
    }];

    [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.left.equalTo(ws.mas_left).offset(60);
        make.right.equalTo(ws.mas_left).offset(105);
        make.height.equalTo(45);
    }];
    [self.weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.height.equalTo(45);
        make.left.equalTo(ws.qqBtn.mas_right).offset(60);
        make.right.equalTo(ws.qqBtn.mas_right).offset(105);
    }];

    [self.webBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.height.equalTo(45);
        make.right.equalTo(ws.mas_right).offset(-60);
        make.left.equalTo(ws.weChatBtn.mas_right).offset(60);

    }];
    
}
#pragma mark
#pragma mark 懒加载
- (UILabel *)midllLable
{
    if (!_midllLable) {
        _midllLable = [[UILabel alloc] init];
        _midllLable.text = @"一键登录";
        _midllLable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _midllLable.textAlignment = NSTextAlignmentCenter;
        _midllLable.textColor = [UIColor grayColor];
    
    }
    return _midllLable;
}
- (UILabel *)lineLable
{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = [UIColor grayColor];
    }
    return _lineLable;
}
- (UIButton *)qqBtn
{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_qqBtn setBackgroundImage:[UIImage imageNamed:@"注册界面微博登录 (4)"] forState:(UIControlStateNormal)];
        [_qqBtn addTarget:self action:@selector(qqlogin) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _qqBtn;
}
//qq的登录
- (void)qqlogin{
    
    if (_tkBtn) {
        _tkBtn();
    }
}
- (UIButton *)webBtn
{
    if (!_webBtn) {
        _webBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_webBtn setBackgroundImage:[UIImage imageNamed:@"注册界面微博登录 (1)"] forState:(UIControlStateNormal)];
    }
    return _webBtn;
}
- (UIButton *)weChatBtn
{
    if (!_weChatBtn) {
        _weChatBtn = [UIButton buttonWithType:UIButtonTypeSystem];
       [_weChatBtn setBackgroundImage:[UIImage imageNamed:@"注册界面微博登录 (7)"] forState:(UIControlStateNormal)];
    
    }
    return _weChatBtn;
}

@end
