//
//  XYBaseNavController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYBaseNavController.h"

@interface XYBaseNavController ()

@end

@implementation XYBaseNavController

//在使用XYBaseNavController的时候调用,只调用一次
+ (void)initialize {

    if (self == [XYBaseNavController class]) {
        
        
        //改变NavgationBar的样式
        UINavigationBar *navbar = [UINavigationBar appearance];
        
        [navbar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        navbar.tintColor = [UIColor whiteColor];
        
        NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:16],NSForegroundColorAttributeName : [UIColor whiteColor]};
        
        //统一设置标题的主题样式
        [navbar setTitleTextAttributes:dict];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
