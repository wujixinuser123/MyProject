//
//  WUTableViewCell.h
//  6.17日项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUGroupModel.h"
@interface WUTableViewCell : UITableViewCell
@property (strong,nonatomic)  WUGroupModel *groupleModel;
@property (strong,nonatomic)  NSArray *groupArr;
@end
