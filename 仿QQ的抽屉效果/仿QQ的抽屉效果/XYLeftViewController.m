//
//  XYLeftViewController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/5/30.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYLeftViewController.h"
#import "XYIconView.h"
#import "MainViewController.h"
#import "XYBaseViewController.h"
#import "XYDrawerViewController.h"

@interface XYLeftViewController ()<UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

@end

@implementation XYLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    //隐藏导航条
    self.navigationController.navigationBarHidden = YES;
  
    [self setupBackgroundImg];
    
    [self setupTableView];
    
    [self setupHeader];
    
    [self setupBottomBtn];

}


- (void)setupBackgroundImg {

    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    bgImgView.image = [UIImage imageNamed:@"leftBg"];
    
    [self.view addSubview: bgImgView];


}

//头
- (void)setupHeader {

    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;

    XYIconView *iconView = [XYIconView iconView];
    
    iconView.backgroundColor = [UIColor clearColor];
    
    iconView.frame = CGRectMake(0, 0, width - 75, 1/3.0 * height);
    
    [self.view addSubview:iconView];
    

}

//底部按钮
- (void)setupBottomBtn {


    CGFloat height = self.view.bounds.size.height;
    
    UIButton *settBtn = [[UIButton alloc] init];
    
    [settBtn addTarget:self action:@selector(didClickSettingbtn) forControlEvents:UIControlEventTouchUpInside];
    
    [settBtn setTitle:@"设置" forState:UIControlStateNormal];
    
    [settBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    settBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    settBtn.frame = CGRectMake(20, height - 39, 40, 21);
    
    [self.view addSubview:settBtn];
    

    
    
    UIButton *nightBtn = [[UIButton alloc] init];
    
    [nightBtn setTitle:@"夜间" forState:UIControlStateNormal];
    
    [nightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    nightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    nightBtn.frame = CGRectMake(80, height - 39, 40, 21);
    
    [self.view addSubview:nightBtn];
    


}


//点击设置按钮的事件
- (void)didClickSettingbtn {


    
    
    
    XYBaseViewController *bVc = [[XYBaseViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:bVc];
    
    [[XYDrawerViewController shareDrawer] switchViewController:nav];





}

//tableView
- (void)setupTableView {


    UITableView *tableView = [[UITableView alloc] init];
    
    tableView.backgroundColor = [UIColor clearColor];
    
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource = self;
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    CGFloat tabX = 0;
    CGFloat tabY = 1/3.0 * height;
    CGFloat tabW = width - 75;
    CGFloat tabH = 2/3.0 * height - 49;
    
    tableView.frame = CGRectMake(tabX, tabY, tabW, tabH);
    
    [self.view addSubview:tableView];



}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"QQ";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"item%zd",indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    return cell;



}


@end
