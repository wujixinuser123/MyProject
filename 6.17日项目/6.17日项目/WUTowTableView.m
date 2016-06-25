//
//  WUTowTableView.m
//  6.17日项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUTowTableView.h"

@interface WUTowTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)    UITableView *leftTableView;
@property (strong,nonatomic)    UITableView *rightTableView;

@end
@implementation WUTowTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (UITableView *)leftTableView{
    if (!_leftTableView) {
        _rightTableView = [[UITableView alloc] init];
    }
    return _leftTableView;
}
- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] init];
    }
    return _rightTableView;
}
@end
