



//
//  WURegistView.m
//  6.17日项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WURegistView.h"
#import "WUNSTimer.h"
#import "textFileView.h"
@interface WURegistView ()<UITextFieldDelegate>

@property (strong,nonatomic)    UITextField *backField;
@property (strong,nonatomic)    UIButton *textBtn;
@property (copy,nonatomic)      NSMutableDictionary *dataDict;
@property (strong,nonatomic)    UIButton *registBtn;
@property (strong,nonatomic)    UITextField *codeText;
@end

@implementation WURegistView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.backlable];
    [self.view addSubview:self.backField];
    [self.view addSubview:self.textBtn];
}
- (UITextField *)backField{
    if (!_backField) {
        _backField = [[UITextField alloc] initWithFrame:CGRectMake(15, 100, self.view.frame.size.width - 165, 50)];
        _backField.delegate = self;
        _backField.layer.borderWidth = 1;
        _backField.layer.borderColor = RGB(200, 140, 104).CGColor;
        _backField.keyboardType = UIKeyboardTypeNumberPad;
        _backField.placeholder = @"请输入手机号";
        
    }
    return _backField;
}
- (UIButton *)textBtn
{
    if (!_textBtn) {
        _textBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _textBtn.frame = CGRectMake(self.view.frame.size.width - 150,100,135, 50);
        _textBtn.layer.borderWidth = 1;
        _textBtn.layer.borderColor = RGB(200, 140, 104).CGColor;
        [_textBtn setTitle:@"获取验证码"forState:(UIControlStateNormal)];
        [_textBtn addTarget:self action:@selector(postData) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _textBtn;
}
//定时器
- (UITextField *)codeText{
    if (!_codeText) {
        _codeText = [[UITextField alloc] initWithFrame:CGRectMake(15, 170, self.view.frame.size.width - 165, 50)];
        _codeText.delegate = self;
        _codeText.layer.borderWidth = 1;
        _codeText.layer.borderColor = RGB(200, 140, 104).CGColor;
        _codeText.keyboardType = UIKeyboardTypeNumberPad;
        _codeText.placeholder = @"输入验证码";

    }
    return _codeText;
}
- (UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [UIButton  buttonWithType:UIButtonTypeSystem];
        _registBtn.frame = CGRectMake(self.view.frame.size.width - 150,170,135, 50);

        [_registBtn setTitle:@"点击开始注册" forState:UIControlStateNormal];
        [_registBtn addTarget:self action:@selector(registPost) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}
//网络请求
- (void)registPost{
    //网络请求
    NSString *str = @"appMember/appRegistration.do";
    //请求体 将注册输入的带回appMember/appRegistraZon.do
    textFileView *tw = [[textFileView alloc] init];
    
    WS(weakSelf);
    tw.landingBlock = ^(NSDictionary *dic){
        weakSelf.dataDict = (NSMutableDictionary*)dic;
        [weakSelf.dataDict addEntriesFromDictionary:@{@"Code":weakSelf.codeText.text,@"Telephone":weakSelf.backField.text}];
        [weakSelf postDataFromSever:str parameter:weakSelf.dataDict isSuccess:^(NSURLSessionDataTask *task, id project) {
            NSLog(@"请求成功");
            
        } isError:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@",error.localizedDescription);
            
        }];
        
    };

}
- (void)postData{
    [WUNSTimer GCDTimeMethod:self.textBtn];
    //获取验证码
    NSString *str = @"http://123.57.141.249:8080/beautalk/appMember/createCode.do";
    NSDictionary *dictionary = @{@"MemberId":self.backField.text};
        
    [self postDataFromSever:str parameter:dictionary isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSLog(@"%@",project);
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (NSMutableDictionary *)dataDict
{
    if (!_dataDict) {
        _dataDict = [[NSMutableDictionary alloc] init];
        
    }
    return _dataDict;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
