//
//  XYNewsNavController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYNewsNavController.h"
#import "NewsViewController.h"

@interface XYNewsNavController ()

@end

@implementation XYNewsNavController

- (instancetype)init {
    
   
    NewsViewController *newsVc = [[NewsViewController alloc] init];
    
    return [super initWithRootViewController:newsVc];
    
 

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarItem.title = @"消息";
    
    self.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
    
    self.tabBarItem.badgeValue = @"99+";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
