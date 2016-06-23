//
//  WUBackscroll.m
//  6.17日项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 wu. All rights reserved.
//

#import "WUBackscroll.h"

@interface WUBackscroll ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>

@end
@implementation WUBackscroll

- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
@end
