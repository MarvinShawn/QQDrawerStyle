//
//  MainViewController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "MainViewController.h"
#import "XYNewsNavController.h"
#import "LinkMenNavController.h"
#import "ComingsNavController.h"
#import "XYDrawerViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupLeftBtn];
    
    
    [self addNav];

}

//添加左上角的按钮
- (void)setupLeftBtn {
    
    
    UIButton *leftBtn = [[UIButton alloc] init];
    
    //相当于调用了XYDrawerViewController 里的openLeftView方法
    [leftBtn addTarget:[XYDrawerViewController shareDrawer] action:@selector(openLeftView) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftBtn = leftBtn;
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_star"] forState:UIControlStateNormal];
    
    
    leftBtn.frame = CGRectMake(10, 25, 30, 30);
    
    [self.view addSubview:leftBtn];;
    
    
    
}


//添加子控制器
- (void)addNav {

    XYNewsNavController *newNav = [[XYNewsNavController alloc] init];
    
    LinkMenNavController *linkNav = [[LinkMenNavController alloc] init];
    
    ComingsNavController *comingNav = [[ComingsNavController alloc] init];
    
    self.viewControllers = @[newNav,linkNav,comingNav];

}

@end
