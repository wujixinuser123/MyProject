//
//  WUTimeViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUTimeViewController.h"
#import "WUScrollView.h"
#import "RootClass.h"
@interface WUTimeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)    UIScrollView *backScrollView;/**底视图*/

@property (strong,nonatomic)    WUScrollView *myScrollView;/**第一个滚动的视图*/
//创建一个数组来保存模型
@property (strong,nonatomic)    NSMutableArray *dataArray;
@end

@implementation WUTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backScrollView];
    self.backScrollView.backgroundColor = [UIColor whiteColor];
    [self.backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.right.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    [self.backScrollView addSubview:self.myScrollView];
    WS(weakSelf);

    [self.myScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(64+230);
        make.left.right.equalTo(weakSelf.view);
    }];
    [self toGetTheData];
}
#pragma mark
#pragma mark 懒加载视图
//作为最底层的视图
- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc] init];
        _backScrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height*3);
    }
    return _backScrollView;
}
//滚动的视图
- (WUScrollView *)myScrollView{
    if (!_myScrollView) {
        _myScrollView = [[WUScrollView alloc] init];
            }
    return _myScrollView;
}
#pragma mark
#pragma mark 请求数据
- (void)toGetTheData{
    NSString *str = @"http://123.57.141.249:8080/beautalk/appHome/appHome.do";
    [self getDataFromSever:str parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = (NSDictionary*)project;
        //解析数据
        NSArray *array = [[NSArray alloc] init];
        array = (NSArray*)dic;
        //存储root对象
        for (NSDictionary *theDic in array) {
            RootClass *root = [[RootClass alloc] initWithDictionary:theDic];
            [self.dataArray addObject:root];
        }
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
@end
