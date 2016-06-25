






//
//  WUGroupTableView.m
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUGroupTableView.h"

@interface WUGroupTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation WUGroupTableView

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *add = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:add];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:add];
    }
    return cell;
}
@end
