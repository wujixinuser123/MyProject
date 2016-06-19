//
//  WUTimeViewController.m
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUTimeViewController.h"
#import "textFileView.h"
@interface WUTimeViewController ()
@property (strong,nonatomic)    textFileView *text;
@end

@implementation WUTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.text.userInteractionEnabled = YES;

    [self.view addSubview:self.text];
}
#pragma mark
#pragma mark 懒加载视图
- (textFileView *)text
{
    if (!_text) {
        _text = [[textFileView alloc] initWithFrame:CGRectMake(0, 64,self.view.frame.size.width ,self.view.frame.size.height)];
    }
    return _text;
}

@end
