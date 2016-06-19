//
//  WULoginViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WULoginViewController.h"
#import "textFileView.h"
#import "WUNextView.h"
@interface WULoginViewController ()
@property (strong,nonatomic)    textFileView *textView;
@property (strong,nonatomic)    WUNextView *nextView;

@end

@implementation WULoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    __weak typeof (self)ws = self;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).offset(65);
        make.right.left.equalTo(ws.view);
        make.height.equalTo(200);
    }];
    [self.view addSubview:self.nextView];

    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.textView.mas_bottom);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(100);
    }];
    [_textView.layButton setBackgroundImage:[UIImage imageNamed:@"注册界面下一步按钮"] forState:UIControlStateNormal];
    [_textView.layButton setTitle:@"" forState:(UIControlStateNormal)];
    [_textView.longButton setTitle:@"去登陆" forState:UIControlStateNormal];
}
#pragma mark
#pragma mark 懒加载
- (textFileView *)textView
{
    if (!_textView) {
        _textView = [[textFileView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];

    }
    return _textView;
}
- (WUNextView *)nextView
{
    if (!_nextView) {
        _nextView = [[WUNextView alloc] init];
        _nextView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _nextView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
