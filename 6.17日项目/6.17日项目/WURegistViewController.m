







//
//  WURegistViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.

#import "WURegistViewController.h"
#import "textFileView.h"
#import "WUNextView.h"
#import "WURegistView.h"
@interface WURegistViewController ()
@property (strong,nonatomic)    UILabel *textLable;
@property (strong,nonatomic)    textFileView *textView;
@property (strong,nonatomic)    WUNextView *nextView;
@end

@implementation WURegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.textLable];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.nextView];
    //设置坐标
    __weak typeof(self)ws = self;
    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(ws.view).offset(64);
        make.left.equalTo(ws.view.mas_left).offset(15);
        make.height.equalTo(34);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.textLable.mas_bottom);
        make.right.left.equalTo(ws.view);
        make.height.equalTo(200);
    }];
    
    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.textView.mas_bottom);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(100);
    }];
    
}
#pragma mark
#pragma mark 懒加载
- (UILabel *)textLable{
    if (!_textLable) {
        _textLable = [[UILabel alloc] init];
        _textLable.text = [NSString stringWithFormat:@"请输入手机号码注册新用户"];
        _textLable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _textLable.textAlignment = NSTextAlignmentLeft;
        _textLable.textColor = [UIColor grayColor];
        _textLable.font = [UIFont systemFontOfSize:15];
    }
    return _textLable;
}
- (textFileView *)textView
{
    if (!_textView) {
        _textView = [[textFileView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];
        UIButton *btn = [_textView valueForKey:@"loginButton"];
//        [btn setImage:[UIImage imageNamed:@"注册界面下一步按钮"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"注册界面下一步按钮"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pushToRegistView) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _textView;
}
//跳到下个界面(将手机号,密码传过去)
- (void)pushToRegistView{
    WS(weakSelf);
    _textView.loginBlock = ^(NSDictionary *dic){
        WURegistView *vie = [[WURegistView alloc] init];
        vie.dataDic = dic;
        [weakSelf.navigationController pushViewController:vie animated:NO];
    };

}
- (WUNextView *)nextView{
    if (!_nextView) {
        _nextView = [[WUNextView alloc] init];
    }
    return _nextView;
}
@end