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
#import "WUBtnView.h"
#import "WUTowTableView.h"
#import "WUGroupTableView.h"
#import "WUSingleTableView.h"
#import "WUSingleModel.h"
#import "WUGroupModel.h"
@interface WUTimeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)    UIScrollView *backScrollView;/**底视图*/

@property (strong,nonatomic)    WUScrollView *myScrollView;/**第一个滚动的视图*/
@property (strong,nonatomic)    WUBtnView *btnView;/**btn的加载视图*/

@property (strong,nonatomic)    WUGroupTableView *gruopTableView;/**俩个tableView*/
@property (strong,nonatomic)    WUSingleTableView *singleTableView;

@end

@implementation WUTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backScrollView];
    WS(weakSelf);
    [self.backScrollView addSubview:self.myScrollView];
    [self.myScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backScrollView.mas_top);
        make.size.equalTo(CGSizeMake(self.view.frame.size.width, 230));
        make.left.equalTo(weakSelf.backScrollView.mas_left);
    }];
    
    self.btnView.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:self.btnView];

    [self.backScrollView addSubview:self.singleTableView];
    [self.backScrollView addSubview:self.gruopTableView];

    [self toGetTheData];
    [self theSingleTableViewData];
    [self theGroupTableViewData];
    
}
#pragma mark
#pragma mark 懒加载视图
//作为最底层的视图
- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64 -49)];
        _backScrollView.delegate = self;
        [_backScrollView setContentOffset:(CGPointZero)];
        _backScrollView.contentSize = CGSizeMake(self.view.frame.size.width,1700 + 280);
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
//俩个btn的加载
- (WUBtnView *)btnView
{
    if (!_btnView) {
        _btnView = [[WUBtnView alloc] initWithFrame:CGRectMake(0, 230, self.view.frame.size.width, 50)];
        [_btnView.groupBtn addTarget:self action:@selector(changTheTowTableView:) forControlEvents:UIControlEventTouchUpInside];
        
        [_btnView.sinilBtn addTarget:self action:@selector(changTheTowTableView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnView;
}
//俩个tableView视图
- (WUSingleTableView *)singleTableView{
    if (!_singleTableView   ) {
        _singleTableView = [[WUSingleTableView alloc] initWithFrame:CGRectMake(0, 280, VIEW_WIDTH, 1700) style:UITableViewStylePlain];
        _singleTableView.scrollEnabled = NO;
    }
    return _singleTableView;
}
- (WUGroupTableView *)gruopTableView{
    if (!_gruopTableView   ) {
        _gruopTableView = [[WUGroupTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 280, self.view.frame.size.width, 1800) style:UITableViewStylePlain];
    }
    return _gruopTableView;
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
        NSMutableArray *mutarray = [[NSMutableArray alloc] initWithCapacity:10];
        for (NSDictionary *theDic in array) {
            RootClass *root = [[RootClass alloc] initWithDictionary:theDic];
            [mutarray addObject:root.imgView];
        }
        self.myScrollView.dataArray = mutarray;
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
- (void)theGroupTableViewData{
     NSString *str = @"appActivity/appActivityList.do";
  [self getDataFromSever:str parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
      
        NSDictionary *dataDic = (NSDictionary*)project;
        NSArray *dataArray = (NSArray*)dataDic;
      NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:10];
      for (NSDictionary*dic in dataArray) {
          
      }
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];

}
- (void)theSingleTableViewData{
    
    NSString *str = @"appActivity/appHomeGoodsList.do";
    [self getDataFromSever:str parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        
        NSDictionary *dataDic = (NSDictionary*)project;
        NSArray *dataArray = (NSArray*)dataDic;
        
        NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:10];
        for (NSDictionary*dic in dataArray) {
            WUSingleModel *model = [WUSingleModel theSingleTableViewDataSource:dic];
            [mutArray addObject:model];
//            NSLog(@"----%@",dic);

        }
        self.singleTableView.singleArr = mutArray;
        [self.singleTableView reloadData];
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];

}

#pragma mark
#pragma maek  当滑动视图时修改btnView的视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:self.backScrollView]) {
        if (scrollView.contentOffset.y > 230) {
            CGRect rect = self.btnView.frame;
            rect.origin.y = scrollView.contentOffset.y;
            self.btnView.frame = rect;
        }else{
            self.btnView.frame = CGRectMake(0, 230,self.view.frame.size.width,50);
        }
    
    }
}
#pragma mark
#pragma mark 当选中按钮时显示不同的tableView

- (void)changTheTowTableView:(UIButton*)sender {
    if (sender == self.btnView.sinilBtn) {
        self.btnView.sinilBtn.selected = YES;
        self.btnView.groupBtn.selected = NO;
        [UIView animateWithDuration:1 animations:^{
            CGRect singlerect = _singleTableView.frame;
            singlerect.origin.x = 0;
            _singleTableView.frame = singlerect;
            
            CGRect rect = _gruopTableView.frame;
            rect.origin.y = VIEW_WIDTH;
            _gruopTableView.frame = rect;
        }];
    }else{
        self.btnView.sinilBtn.selected = NO;
        self.btnView.groupBtn.selected = YES;
        [UIView animateWithDuration:1 animations:^{
            CGRect singlerect = _singleTableView.frame;
            singlerect.origin.x = -VIEW_WIDTH;
            _singleTableView.frame = singlerect;
            
            CGRect rect = _gruopTableView.frame;
            rect.origin.y = 0;
            _gruopTableView.frame = rect;
        }];
    }
}
@end
