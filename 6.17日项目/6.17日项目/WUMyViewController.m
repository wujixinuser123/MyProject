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
        make.height.mas_equalTo(125);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom).offset(35);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(88+88);
    }];
    [self TheDataInPutArray];
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
    NSArray  *array = @[image1,image2,image3,image4];

    NSArray *arr = @[@"我的收藏",@"意见反馈",@"关于我们",@"客服热线"];
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
