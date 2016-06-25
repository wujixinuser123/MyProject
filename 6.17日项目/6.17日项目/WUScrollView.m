
//
//  WUScrollView.m
//  6.17日项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUScrollView.h"
#import <SDCycleScrollView.h>
@interface WUScrollView ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate,SDCycleScrollViewDelegate>


@end
@implementation WUScrollView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.contentSize = CGSizeMake(self.frame.size.width*3,self.frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.delegate = self;
    }
    return self;
}
//获取到的图片
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"1"]];
    scrollView.pageControlStyle = SDCycleScrollViewPageContolAlimentCenter;
    scrollView.currentPageDotColor = [UIColor whiteColor];
    
    [self addSubview:scrollView];
    scrollView.imageURLStringsGroup = dataArray;

}
@end
