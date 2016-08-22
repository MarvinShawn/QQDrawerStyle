//
//  NewsViewController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "NewsViewController.h"
#import "XYNews.h"
#import "XYNewsCell.h"
#import "XTPopView.h"

@interface NewsViewController ()<selectIndexPathDelegate>

@property (nonatomic,strong) NSArray *newsArr;

@property (nonatomic,strong) NSArray *phoneArr;

@property (nonatomic,weak) UISegmentedControl *segCtl;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    //添加左边的按钮
   // [self setupLeftBtn];
    
    //添加中间的选择按钮
    [self setupSegmentedControl];
    
    
    //添加右边的加号按钮
    [self setupRightPlusBtn];
    
    //搜索按钮
    [self setupSearchBtn];
    
    //注册cell
    [self.tableView registerClass:[XYNewsCell class] forCellReuseIdentifier:@"消息"];
    
    
    //设置行高
    self.tableView.rowHeight = 60;
   
}


//添加左边的按钮
- (void)setupLeftBtn {


    UIButton *leftBtn = [[UIButton alloc] init];
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_star"] forState:UIControlStateNormal];
    
    
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];

    

}

//添加中间的选择按钮
- (void)setupSegmentedControl {


    UISegmentedControl *segCtl = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"电话"]];
    
    self.segCtl = segCtl;
    
    [segCtl addTarget:self action:@selector(changeSeg:) forControlEvents:UIControlEventValueChanged];
    
    segCtl.selectedSegmentIndex = 0;
    
    self.navigationItem.titleView = segCtl;
    
    
}

//选择"消息"或者"电话"
- (void)changeSeg:(UISegmentedControl *)segctl {

    //NSLog(@"%zd",segctl.selectedSegmentIndex);
    [self.tableView reloadData];
    

}


//搜索按钮
- (void)setupSearchBtn {
    

    CGFloat margin = 10;
    
    CGFloat width = self.view.bounds.size.width;
    
    UIButton *searchBtn = [[UIButton alloc] init];
    
    [searchBtn addTarget:self action:@selector(didClickSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    
    searchBtn.frame = CGRectMake(margin, 0,width - 2 * margin , 21);
    
    [searchBtn setTitle:@"🔍 搜索" forState:UIControlStateNormal];
    
    searchBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    searchBtn.backgroundColor = [UIColor lightGrayColor];
    
    searchBtn.layer.cornerRadius = 3;
    
    searchBtn.layer.masksToBounds = YES;
    
    
    
    UIView *view = [[UIView alloc] init];
    
    view.frame = searchBtn.frame;
    
    self.tableView.tableHeaderView = view;
    
    [view addSubview:searchBtn];
    
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);

}


//点击了搜索按钮
- (void)didClickSearchBtn {
    
 
    
    NSLog(@"好懒啊,不想加这个页面了,你加吧");
    
    
    
}


- (void)setupRightPlusBtn {

    

    UIButton *plusBtn = [[UIButton alloc] init];
    plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.frame = CGRectMake(0, 0, 40, 40);
    [plusBtn setTitle:@"➕" forState:UIControlStateNormal];

    [plusBtn addTarget:self action:@selector(didClickPlusBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:plusBtn];
    self.navigationItem.rightBarButtonItem = btn;
    


}


//加号按钮的回调
- (void)didClickPlusBtn:(UIButton *)btn {
    

    CGPoint point = CGPointMake(btn.center.x, btn.frame.origin.y + 64);
    
   // NSLog(@"%f",btn.center.x);
    
    XTPopView *arrowView = [[XTPopView alloc] initWithOrigin:point Width:200 Height:6 * 40 Type:XTTypeOfUpCenter Color:[UIColor whiteColor]];

    arrowView.dataArray = @[@"多人聊天",@"加好友",@"扫一扫",@"发送到电脑",@"面对面快传",@"付款"];
    arrowView.fontSize = 13;
    arrowView.row_height = 40;
    arrowView.titleTextColor = [UIColor blackColor];
    arrowView.delegate = self;
  //  arrowView.images ;
    [arrowView popView];
   

}

- (void)selectIndexPathRow:(NSInteger)index {



    switch (index) {
        case 0:
        {
            NSLog(@"Click 0 ......");
        }
            break;
        case 1:
        {
            NSLog(@"Clikc 1 ......");
        }
            break;
        case 2:
        {
            NSLog(@"Clikc 2 ......");
        }
            break;
        case 3:
        {
            NSLog(@"Clikc 3 ......");
        }
            break;
        default:
            break;
    }





}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if(self.segCtl.selectedSegmentIndex == 0) {
        
        return self.newsArr.count;
        
        
    }else if(self.segCtl.selectedSegmentIndex == 1){
    
    
        return self.phoneArr.count;
    
    }
    
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    XYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"消息" forIndexPath:indexPath];
    
    XYNews *news;
    
    if(self.segCtl.selectedSegmentIndex == 0) {
        
        //取数据
         news = self.newsArr[indexPath.row];
        
         cell.news = news;
        
        
    }else if(self.segCtl.selectedSegmentIndex == 1){
        
        cell.phoneNews = self.phoneArr[indexPath.row];
    }
    
   
    
    return cell;
}


//懒加载

- (NSArray *)newsArr {

    if (!_newsArr) {
        
        _newsArr = [XYNews newsInfo];
        
    }
    
    return _newsArr;
}


- (NSArray *)phoneArr {

    if (!_phoneArr) {
        
    
        _phoneArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"phoneNews.plist" ofType:nil]];
    }

    return _phoneArr;

}

@end
