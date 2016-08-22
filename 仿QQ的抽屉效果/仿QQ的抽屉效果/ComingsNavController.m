//
//  ComingsNavController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "ComingsNavController.h"
#import "ComingViewController.h"

@interface ComingsNavController ()

@end

@implementation ComingsNavController

- (instancetype)init {
    
    
    ComingViewController *comingVc = [[ComingViewController alloc] init];
    
    return [super initWithRootViewController:comingVc];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarItem.title = @"动态";
    
    self.tabBarItem.image = [UIImage imageNamed:@"tab_qworld_nor"];
    
    
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
