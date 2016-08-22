//
//  XYNewsCell.h
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYNews;
@interface XYNewsCell : UITableViewCell

@property (nonatomic,strong) XYNews *news;

@property (nonatomic,strong) NSString *phoneNews;


@end
