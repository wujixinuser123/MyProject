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
        make.top.equalTo(ws.mas_top).offset(50);
        make.left.equalTo(ws.mas_left).offset(54);
        make.right.equalTo(ws.mas_right).offset(-230);
        make.height.equalTo(35);
    }];
    [self.weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(50);
        make.height.equalTo(35);
        make.left.equalTo(ws.qqBtn.mas_right).offset(55);
        make.right.equalTo(ws.mas_right).offset(-140);
    }];

    [self.webBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(50);
        make.height.equalTo(35);
        make.right.equalTo(ws.mas_right).offset(-54);
        make.left.equalTo(ws.weChatBtn.mas_right).offset(50);

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
    }
    return _qqBtn;
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
