//
//  WUNextView.h
//  6.17日项目
//
//  Created by ma c on 16/6/18.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TakeBtnBlock)();
@interface WUNextView : UIView
//外设接口改变btn的内容
@property (strong,nonatomic) TakeBtnBlock tkBtn;
@end
