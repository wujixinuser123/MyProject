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
#import "WURegistViewController.h"
#import "WULoginViewController.h"
//遵守代理在代理方法中实现视图的跳转
@interface WUMyViewController ()<WUTopViewLoginDelegate>
@property (strong,nonatomic)    WUTopView *topView;

@property (strong,nonatomic)    WUTableView *tableView;
/**处理视图的数据*/
@property (strong,nonatomic)    NSMutableArray *dataArray;
@property (strong,nonatomic)    NSMutableArray *nameDataArray;
@property (strong,nonatomic)    UIButton *pushOutBtn;

@end

@implementation WUMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    __weak typeof(self)ws = self;
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view.mas_top).offset(64);
        make.left.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(124);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom).offset(35);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(88+88+88);
    }];
    [self.view addSubview:self.pushOutBtn];
    [self.pushOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.tableView.mas_bottom).offset(30);
        make.left.equalTo(ws.view.mas_left).offset(46);
        make.right.equalTo(ws.view.mas_right).offset(-46);
        make.height.equalTo(40);
    }];
    //数据的传送
    [self TheDataInPutArray];
    //按钮按下页面的变化
}
#pragma mark
#pragma mark 跳转到俩个界面WUTopViewLoginDelegate
- (void)jumpToLoginView{
    
    WULoginViewController *logView = [[WULoginViewController alloc] init];
    [self.navigationController pushViewController:logView animated:NO];
    
}

- (void)jumpToRegistView
{
    WURegistViewController *regView = [[WURegistViewController alloc] init];
    [self.navigationController pushViewController:regView animated:NO];
    
}
#pragma mark
#pragma mark 数据的处理
- (void)TheDataInPutArray{
    //添加图文到数组中
    UIImage *image1 = [UIImage imageNamed:@"我的界面我的收藏图标"];
    UIImage *image2 = [UIImage imageNamed:@"我的界面意见反馈图标"];
    UIImage *image3 = [UIImage imageNamed:@"我的界面关于我们图标"];
    UIImage *image4 = [UIImage imageNamed:@"我的界面客服热线图标"];
    UIImage *image5 = [UIImage imageNamed:@"我的界面我的优惠券图标"];
    UIImage *image6 = [UIImage imageNamed:@"我的界面邀请好友图标"];

    NSArray  *array = @[image1,image2,image3,image4,image5,image6];

    NSArray *arr = @[@"我的收藏",@"意见反馈",@"关于我们",@"客服热线",@"我的优惠券",@"邀请好友，立刻赚钱"];
    [self.dataArray addObjectsFromArray:array];
    [self.nameDataArray addObjectsFromArray:arr];
    self.tableView.arrayImageData = self.dataArray;
    self.tableView.arrayNameData = self.nameDataArray;
}

#pragma mark
#pragma mark 懒加载视图
- (WUTopView *)topView
{
    if (!_topView) {
        _topView = [[WUTopView alloc] init];
        _topView.loginDelegat = self;
    }
    return _topView;
}
- (WUTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[WUTableView alloc] init];
    
    }
    return _tableView;
}
- (UIButton *)pushOutBtn{
    if (!_pushOutBtn) {
        _pushOutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pushOutBtn setBackgroundImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:UIControlStateNormal];
        [_pushOutBtn addTarget:self action:@selector(changeTheView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushOutBtn;
}
- (void)changeTheView{
    self.pushOutBtn.hidden = YES;
    self.topView.tsLable.hidden = YES;
    self.topView.sxtImage.hidden = YES;
    self.topView.sxtlabel.hidden = YES;
    self.topView.loginBtn.hidden = NO;
    self.topView.registBtn.hidden = NO;
    __weak typeof(self)ws = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom).offset(35);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(88+88);
    }];


}
#pragma mark
#pragma mark 存储数据的数组
- (NSMutableArray *)dataArray
{
    if (!_dataArray){
        
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)nameDataArray
{
    if (!_nameDataArray) {
        _nameDataArray = [[NSMutableArray alloc] init];
    }
    return _nameDataArray;
}
@end
