



//
//  textFileView.m
//  6.16项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "textFileView.h"
@interface textFileView ()
@property (strong,nonatomic)    UILabel *labkeLable;
@property (strong,nonatomic)    UILabel *lineLable;
@end
@implementation textFileView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.labkeLable];
        [self addSubview:self.nameText];
        [self addSubview:self.passText];
        [self addSubview:self.layButton];
        [self addSubview:self.longButton];
    }
    return self;
}

- (void)layoutSubviews
{
    //背景
    __weak typeof (self)weakSelf = self;
    [self.labkeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(15);
        make.left.mas_equalTo(weakSelf.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-15);
        make.height.mas_equalTo(88);
    }];
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.labkeLable.mas_top);
        make.left.mas_equalTo(weakSelf.labkeLable.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.labkeLable.mas_right).offset(-15);
        make.height.mas_equalTo(44);
        
    }];
    //    [self.lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.height.mas_equalTo(1);
    //        make.left.mas_equalTo(weakSelf.labkeLable.mas_top).offset(15);
    //        make.right.mas_equalTo(weakSelf.labkeLable.mas_right).offset(-15);
    //        make.top.mas_equalTo(weakSelf.labkeLable.mas_top).offset(44);
    //    }];
    [self.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.labkeLable.mas_left).offset(15);
        make.right.mas_equalTo(weakSelf.labkeLable.mas_right).offset(-15);
        make.top.mas_equalTo(weakSelf.labkeLable.mas_bottom).offset(-44);
        make.height.mas_equalTo(44);
    }];
    [self.layButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.labkeLable.mas_bottom).offset(16);
        make.left.mas_equalTo(weakSelf.mas_left).offset(16);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-16);
        make.height.mas_equalTo(35);
    }];
    [self.longButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(80, 25));
        make.top.equalTo(weakSelf.layButton.mas_bottom).offset(17);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
    }];
}
- (UILabel *)labkeLable
{
    if (!_labkeLable) {
        _labkeLable = [[UILabel alloc] init];
        _labkeLable.backgroundColor = [UIColor whiteColor];
    }
    return _labkeLable;
    
}
- (UITextField *)nameText
{
    if (!_nameText) {
        _nameText = [[UITextField alloc] init];
        _nameText.backgroundColor = [UIColor whiteColor];
        _nameText.borderStyle = UITextBorderStyleRoundedRect;
        _nameText.placeholder = @"请输出入账号";
    }
    return _nameText;
}
- (UITextField *)passText
{
    if (!_passText) {
        _passText = [[UITextField alloc] init];
        _passText.backgroundColor = [UIColor whiteColor];
        _passText.borderStyle = UITextBorderStyleRoundedRect;
        _passText.secureTextEntry = YES;
        _passText.placeholder = @"请输入密码";
    }
    return _passText;
}
//- (UILabel *)lineLable
//{
//    if (!_lineLable) {
//        _lineLable = [[UILabel alloc] init];
//        _lineLable.backgroundColor = [UIColor blackColor];
//        
//    }
//    return _lineLable;
//}

- (UIButton *)longButton
{
    if (!_longButton) {
        _longButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_longButton setTitle:@"点击登录" forState:UIControlStateNormal];
//        _longButton.backgroundColor = RGB(90, 160, 215);
        
    }
    return _longButton;
}
- (UIButton *)layButton
{
    if (!_layButton) {
        _layButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_layButton setTitle:@"返回退出" forState:UIControlStateNormal];
        _layButton.titleLabel.textColor = [UIColor redColor];
//        _layButton.backgroundColor = RGB(90, 160, 215);
        
    }
    return _layButton;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.nameText resignFirstResponder];
    [self.passText resignFirstResponder];
}
@end
