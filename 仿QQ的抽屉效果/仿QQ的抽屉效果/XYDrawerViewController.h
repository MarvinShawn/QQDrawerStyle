//
//  XYDrawerViewController.h
//  仿QQ的抽屉效果
//
//  Created by ww on 16/5/30.
//  Copyright © 2016年 ww. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYDrawerViewController : UIViewController


//快速创建一个抽屉控制器
+ (instancetype)drawerVcWithMain:(UIViewController *)mainVC leftVc:(UIViewController *)leftVc leftWidth:(CGFloat) leftWidth;


//返回抽屉控制器
+ (instancetype)shareDrawer;


//切换到指定控制器
- (void)switchViewController:(UIViewController *)vc;


//返回到上一个控制器
- (void)backToLastView;


//返回到主控制器
-(void)backToMainView;

@end
