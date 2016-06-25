//
//  WUMyViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUMyViewController.h"
#import "WUTopView.h"
#import "WUTableView.h"
#import "WULoginViewController.h"
#import "WURegistViewController.h"

@interface WUMyViewController ()

@property (strong, nonatomic)   WUTableView *myTableView;              /** 我的列表 */
@property (strong, nonatomic)   WUTopView *myTableHeadView;              /** 表格头 */


@end

@implementation WUMyViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self judgeIsLogin];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(245, 245, 245);
    [self.view addSubview:self.myTableView];
    WS(weakSelf);
    [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}

- (WUTableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[WUTableView alloc]init];
        //设置表格头
        _myTableView.tableHeaderView = self.myTableHeadView;
        //表格的内容
        _myTableView.dataArray = @[@{@"title":@"我的收藏",@"image":@"我的界面我的收藏图标"},@{@"title":@"意见反馈",@"image":@"我的界面意见反馈图标"},@{@"title":@"关于我们",@"image":@"我的界面关于我们图标"},@{@"title":@"客服热线",@"image":@"我的界面客服热线图标"},@{@"title":@"我的优惠劵",@"image":@"我的界面我的优惠券图标"},@{@"title":@"邀请好友，立刻赚钱",@"image":@"我的界面邀请好友图标"}];
        //退出按钮调用的方法
        WS(weakSelf);
        _myTableView.etBlock = ^{
            [weakSelf judgeIsLogin];
        };
    }
    return _myTableView;
}

- (WUTopView *)myTableHeadView{
    if (!_myTableHeadView) {
        _myTableHeadView = [[WUTopView alloc]initWithFrame:CGRectMake(0, 0, 300, 125)];
        UIButton *loginBtn = [_myTableHeadView valueForKey:@"loginButton" ];
        [loginBtn addTarget:self action:@selector(loginButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
        UIButton *landingBtn = [_myTableHeadView valueForKey:@"landingButton" ];
        [landingBtn addTarget:self action:@selector(landingButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _myTableHeadView;
}

- (void)loginButtonMethod{
    WULoginViewController *login = [[WULoginViewController alloc]init];
    login.title = @"登陆";
    [self.navigationController pushViewController:login animated:YES];
}

- (void)landingButtonMethod{
    WURegistViewController *landing = [[WURegistViewController alloc]init];
    landing.title = @"注册";
    [self.navigationController pushViewController:landing animated:YES];
}

- (void)judgeIsLogin{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults]valueForKey:@"IDLOGIN"];
    [self.myTableHeadView showLandingAndLoginBtn:isLogin];
    [self.myTableView reloadData];
}

@end
