//
//  WUTableView.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//
#import "WUTableView.h"
#import "WUMyTableViewcellTableViewCell.h"
@interface WUTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)   UIView *exitFootView;              /** 推出view */
@property (strong, nonatomic)   UIButton *exitButton;              /** 退出按钮  */
@end
@implementation WUTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
  
    self = [super initWithFrame:frame style:style];
   
      if (self) {
          
          self.bounces = NO;
          self.delegate = self;
          self.dataSource = self;
          self.separatorStyle = UITableViewCellSelectionStyleNone;
        }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{       NSDictionary *islogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"IDLOGIN"];
    if (islogin.count != 0) {
        return 6;
    }else
        return 4;
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *add = @"ID";
    WUMyTableViewcellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:add];
    if (!cell) {
        cell = [[WUMyTableViewcellTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:add];
    }
    cell.cellSource = self.dataArray[indexPath.row];
    
    if (indexPath.row == 3) {
        
        UIImageView *nextImage = [cell valueForKey:@"nextImage"];
        nextImage.hidden = YES;
        UILabel *phoneNumber = [[UILabel alloc]init];
        phoneNumber.textColor = [UIColor grayColor];
        phoneNumber.text = @"4006010545";
        [cell addSubview:phoneNumber];
        __weak typeof(cell) weakCell = cell;
        [phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakCell.mas_right).offset(-15);
            make.size.equalTo(CGSizeMake(110, 15));
            make.centerY.equalTo(weakCell.mas_centerY);
        }];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//设置分组头
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 35;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 35)];
    return headerView;
}
//设置分组尾
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"IDLOGIN"];
    if (isLogin.count != 0){
        return 120.0;
    }else
        return 0.0;
   
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"IDLOGIN"];
    if (isLogin.count != 0) {
        return self.exitFootView;
    }else
        return nil;

}
//初始化用到的视图
- (UIView *)exitFootView{
    if (!_exitFootView) {
        _exitFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 120)];
        _exitFootView.backgroundColor = RGB(245, 245, 245);
        [_exitFootView addSubview:self.exitButton];
        
    }
    return _exitFootView;
}

- (UIButton *)exitButton{
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _exitButton.frame = CGRectMake(50, 40, VIEW_WIDTH-100, 40);
        _exitButton.backgroundColor = RGB(67, 182, 245);
        _exitButton.layer.masksToBounds = YES;
        _exitButton.layer.cornerRadius = 5.0;
        [_exitButton setTitle:@"退  出  登  录" forState:(UIControlStateNormal)];
        [_exitButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_exitButton addTarget:self action:@selector(exitButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _exitButton;
}

- (void)exitButtonMethod{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"IDLOGIN"];

    if (_etBlock) {
        
        _etBlock();
    }
    [self reloadData];
}


@end
