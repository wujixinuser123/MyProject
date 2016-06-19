







//
//  WURegistViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.
/**
 
 登陆名:LoginName
 密码 :Lpassword
xURL:http://123.57.141.249:8080/beautalk/appMember/appRegistraZon.do
 */

#import "WURegistViewController.h"
#import "textFileView.h"
#import "WUNextView.h"
#define URL @"http://123.57.141.249:8080/beautalk/appMember/appRegistraZon.do"
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
    [self.textView.longButton addTarget:self action:@selector(getTheData) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 
#pragma mark  点击登录按钮网络请求
- (void)getTheData{
    
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:60.0];
    request.HTTPMethod = @"POST";
    NSString *str = [NSString stringWithFormat:@"LoginName=%@&Lpassword=%@",self.textView.nameText.text,self.textView.passText.text];
    NSLog(@"%@=-------%@",self.textView.nameText.text,self.textView.passText.text);
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //请求开始
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"请求失败");
        }else{
            NSLog(@"注册成功");
        }
    }];
    [task resume];
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
    }
    return _textView;
}
- (WUNextView *)nextView{
    if (!_nextView) {
        _nextView = [[WUNextView alloc] init];
    }
    return _nextView;
}
@end