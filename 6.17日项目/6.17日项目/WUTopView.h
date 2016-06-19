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
@property (strong,nonatomic)    id<WUTopViewLoginDelegate>loginDelegat;
@end
