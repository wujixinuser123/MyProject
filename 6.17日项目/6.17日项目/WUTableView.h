//
//  WUTableView.h
//  6.17日项目
//
//  Created by ma c on 16/6/17.
//  Copyright © 2016年 wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^exitBlock)();
@interface WUTableView : UITableView

@property (copy,nonatomic)  exitBlock etBlock;//退出回调
@property (strong,nonatomic)    NSArray *dataArray;//数据的传输
@end
