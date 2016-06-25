





//
//  WUSingleTableView.m
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUSingleTableView.h"
#import "WUSingleTableViewCell.h"
#import "WUSingleModel.h"
@interface WUSingleTableView ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation WUSingleTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
//set数组的值

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.singleArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *add = @"ID";
    WUSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:add];
    if (!cell) {
        cell = [[WUSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:add];
    }
    cell.singleModel = self.singleArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}
@end
