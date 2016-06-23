//
//  textFileView.h
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LogInBlock)(NSDictionary *);
typedef void(^LayBlock)(NSDictionary*);
@interface textFileView : UIView
/**登陆block*/
@property (copy, nonatomic) LogInBlock loginBlock;
/**去注册block*/
@property (copy, nonatomic) LayBlock landingBlock;
@end
