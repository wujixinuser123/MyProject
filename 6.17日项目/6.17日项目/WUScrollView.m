
//
//  WUScrollView.m
//  6.17日项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUScrollView.h"

@interface WUScrollView ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>


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
- (void)methodTheBackImage{
    
}
@end
