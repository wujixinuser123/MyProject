//
//  WUTopView.h
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WUTopViewLoginDelegate <NSObject>

- (void)jumpToLoginView;
- (void)jumpToRegistView;
@end

@interface WUTopView : UIView
@property (strong,nonatomic)    UIButton *loginBtn;
@property (strong,nonatomic)    UIButton *registBtn;
@property (strong,nonatomic)    UIImageView *sxtImage;
@property (strong,nonatomic)    UILabel *sxtlabel;
@property (strong,nonatomic)    UILabel *tsLable;
@property (strong,nonatomic)    id<WUTopViewLoginDelegate>loginDelegat;
@end
