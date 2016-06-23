//
//  WULoginViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.

//17721025595 123123

#import "WULoginViewController.h"
#import "textFileView.h"
#import "WUNextView.h"
#import "UMSocialQQHandler.h"
#import "UMSocial.h"
#import "WUQQloginView.h"
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
    //点击按钮事件 直接访问
    UIButton *btn = [_textView valueForKey:@"loginButton"];
    [btn addTarget:self action:@selector(getTheData) forControlEvents:UIControlEventTouchUpInside];
    
    [self methodOfTheQQ];
}
#pragma mark
#pragma mark  第三方登陆
- (void)methodOfTheQQ{
    __weak typeof(self) ws = self;
    self.nextView.tkBtn = ^(TakeBtnBlock *id){
        [WUQQloginView qqLoginMethod:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
        } error:^{
            NSLog(@"错误");
        } whichVC:ws];
    };
    
}
#pragma mark
#pragma mark 点击登陆按钮网络请求
- (void)getTheData{
    WS(weakSelf);
    self.textView.loginBlock = ^(NSDictionary *dic){
        
    [weakSelf getDataFromSever:@"appMember/appLogin.do" parameter:dic isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dataDic = (NSDictionary *)project;
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:dataDic forKey:@"IDLOGIN"];
        //成功后进行页面的返回
        [weakSelf.navigationController popToRootViewControllerAnimated:NO];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error.localizedDescription);
    }];
    };

    
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
