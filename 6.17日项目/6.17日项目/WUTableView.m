//
//  WUTableView.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//17721025595 123123

#import "WUTableView.h"
@interface WUTableView ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation WUTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
  
    self = [super initWithFrame:frame style:style];
   
      if (self) {
          
          self.scrollEnabled = NO;
          self.delegate = self;
          self.dataSource = self;
        }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.arrayImageData.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *add = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:add];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:add];
    }

    cell.imageView.image = self.arrayImageData[indexPath.row];
    if (indexPath.row == 3) {
        cell.detailTextLabel.text = @"400-6010-545";
    }
    cell.textLabel.text = self.arrayNameData[indexPath.row];
    if (indexPath.row != 3) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
@end
