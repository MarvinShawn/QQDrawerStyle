//
//  XYDrawerViewController.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/5/30.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYDrawerViewController.h"
#import "XYLeftViewController.h"
#import "MainViewController.h"

@interface XYDrawerViewController ()

@property (nonatomic,weak) UIViewController *mainVc;

@property (nonatomic,strong) UIViewController *showVc;

@property (nonatomic,weak) UIViewController *leftVc;

@property (nonatomic,assign) CGFloat leftWidth;

@property (nonatomic,strong) UIButton *coverBtn;

@end

@implementation XYDrawerViewController

//快速创建一个具有抽屉效果的控制器
+ (instancetype)drawerVcWithMain:(UIViewController *)mainVc leftVc:(UIViewController *)leftVc leftWidth:(CGFloat)leftWidth {

    XYDrawerViewController *drawerVc = [[self alloc] init];
    
    drawerVc.mainVc = mainVc;
    
    drawerVc.leftVc = leftVc;
    
    drawerVc.leftWidth = leftWidth;
    
    [drawerVc.view addSubview:leftVc.view];
    
    [drawerVc.view addSubview:mainVc.view];

    [drawerVc addChildViewController:mainVc];
    
    [drawerVc addChildViewController:leftVc];
    

    return drawerVc;

}

//返回抽屉控制器
+ (instancetype)shareDrawer {
    
    
    return  (XYDrawerViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;

}


//切换控制器
- (void)switchViewController:(UIViewController *)vc {

     vc.view.frame = self.view.bounds;
    
    self.showVc = vc;
    
    vc.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
    
    [self addChildViewController:vc];
    
    [self.view addSubview:vc.view];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        vc.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
   
    

}

-(void)backToMainView{
 
    self.showVc.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
    [self.showVc.view removeFromSuperview];
    
    //移除控制器
    [self.showVc removeFromParentViewController];
    
    //置空
    self.showVc = nil;
    
    //    [self didClickCoverBtn];
    MainViewController *mainVc = (MainViewController *)self.mainVc;
    //没超过一半,还原
    mainVc.view.transform = CGAffineTransformIdentity;
    
    
    mainVc.leftBtn.alpha = 1;
    
    //因为移动的时候,leftView偏移了,所以也要还原
    self.leftVc.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth * 0.4, 0);
    
    [self.coverBtn removeFromSuperview];
    
    MainViewController * vc = (MainViewController *)self.mainVc;
   
}

//回到跳转前的页面
- (void)backToLastView {
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.showVc.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
        
        
    } completion:^(BOOL finished) {
        
        //移除视图
        [self.showVc.view removeFromSuperview];
        
        //移除控制器
        [self.showVc removeFromParentViewController];
        
        //置空
        self.showVc = nil;

    }];

  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];


  //默认先偏移一个宽度
    self.leftVc.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth, 0);
        //设置mianVc的阴影效果
    
    self.mainVc.view.layer.shadowColor = [UIColor blackColor].CGColor;

    self.mainVc.view.layer.shadowOffset = CGSizeMake(-3, -3);
    
    self.mainVc.view.layer.shadowRadius = 2;
    
    self.mainVc.view.layer.shadowOpacity = 0.2;

    //给mainVc的view添加边缘手势
    for (UIViewController *vc in self.mainVc.childViewControllers) {
        
        [self addSreenEdgePanGestureRecognizerToView:vc.view];
    }
}

- (void)addSreenEdgePanGestureRecognizerToView:(UIView *)view {


    UIScreenEdgePanGestureRecognizer *scPan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    scPan.edges = UIRectEdgeLeft;
    
    
    [view addGestureRecognizer:scPan];


}

//手势回调方法
- (void)panGesture:(UIScreenEdgePanGestureRecognizer *)scPan {

//    NSLog(@"%s", __FUNCTION__);
    
    //获得偏移量
    
    CGFloat offsetX = [scPan translationInView:scPan.view].x;
    CGFloat width = self.view.bounds.size.width;
    
    if (offsetX > self.leftWidth) {
        
        offsetX = self.leftWidth;
    }
    
    if (scPan.state == UIGestureRecognizerStateEnded || scPan.state == UIGestureRecognizerStateCancelled) {
        
        //当手势停止时 或者 取消时,判断是否过屏幕的一半
        if (self.mainVc.view.frame.origin.x > width * 0.5) {
            
            //超过一半,切换到左边的视图
            [self openLeftView];
            
        }else{
        
            [self didClickCoverBtn];
        
        }
        
    }else if (scPan.state == UIGestureRecognizerStateChanged) {
        
        //根据偏移量来偏移
     
        
        MainViewController *mainVc = (MainViewController *)self.mainVc;
        
        mainVc.view.transform = CGAffineTransformMakeTranslation(offsetX, 0);
        
        mainVc.leftBtn.alpha =1 - self.mainVc.view.frame.origin.x / self.leftWidth;
        
        
        self.leftVc.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth * 0.4 + offsetX * 0.4, 0);
        
    }


}


//打开左边的视图
- (void)openLeftView {

    //mainVC向右边偏移self.leftWidth,leftView回到原位
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        MainViewController *mainVc = (MainViewController *)self.mainVc;
        
        mainVc.leftBtn.alpha = 0;
        
        mainVc.view.transform = CGAffineTransformMakeTranslation(self.leftWidth, 0);
        
        self.leftVc.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [self.mainVc.view addSubview:self.coverBtn];
        
        //给coverBtn添加pan手势
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panBtnGesture:)];
        
        [self.coverBtn addGestureRecognizer:pan];
        
        
        //给leftView添加手势
        UIPanGestureRecognizer *leftPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panLeftViewGesture:)];

        
        [self.leftVc.view addGestureRecognizer:leftPan];
        
    }];

}

//leftView的手势回调
- (void)panLeftViewGesture:(UIPanGestureRecognizer *)leftPan {


    CGFloat offsetX = [leftPan translationInView:self.leftVc.view].x;
    
   // NSLog(@"%f",offsetX);
    
    if (offsetX > 0)   offsetX = 0;
    
    CGFloat width = self.view.bounds.size.width;
    
    if (leftPan.state == UIGestureRecognizerStateEnded || leftPan.state == UIGestureRecognizerStateCancelled) {
        
        if (self.mainVc.view.frame.origin.x < width * 0.5) {
            
            [self didClickCoverBtn];
            
        }else{
        
            [self openLeftView];
        
        }
    }
    
    
    if (leftPan.state == UIGestureRecognizerStateChanged) {
        
        self.leftVc.view.transform = CGAffineTransformMakeTranslation(offsetX * 0.4, 0);
        
        
        MainViewController *mainVc = (MainViewController *)self.mainVc;
        
        mainVc.leftBtn.alpha =1 - self.mainVc.view.frame.origin.x / self.leftWidth;
        
        mainVc.view.transform = CGAffineTransformMakeTranslation(self.leftWidth + offsetX, 0);
        
        
        
    }
    
    
    //NSLog(@"%f",offsetX);



}


//cover的手势回调
- (void)panBtnGesture:(UIPanGestureRecognizer *)pan {

    
    CGFloat offsetX = [pan translationInView:self.coverBtn].x;//滑动过程中手移动的偏移量
     CGFloat width = self.view.bounds.size.width;
    
    if (offsetX > 0) {
        return;
    }
    
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        //手势取消,或者停止
        if (self.mainVc.view.frame.origin.x < width * 0.5) {
            //还原
            [self didClickCoverBtn];
            
        }else{
        
            [self openLeftView];
            

        }
        
        
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        //手势移动中
        
       // NSLog(@"%f",offsetX);
        
        MainViewController *mainVc = (MainViewController *)self.mainVc;
        
        mainVc.view.transform = CGAffineTransformMakeTranslation(self.leftWidth + offsetX, 0);
        
        mainVc.leftBtn.alpha = 1 - self.mainVc.view.frame.origin.x / self.leftWidth;
        
        self.leftVc.view.transform = CGAffineTransformMakeTranslation(offsetX * 0.4, 0);

    }
    


}


//点击了coverBtn
- (void)didClickCoverBtn{

    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        
         MainViewController *mainVc = (MainViewController *)self.mainVc;
        //没超过一半,还原
        mainVc.view.transform = CGAffineTransformIdentity;
        
        
        mainVc.leftBtn.alpha = 1;
        
        //因为移动的时候,leftView偏移了,所以也要还原
        self.leftVc.view.transform = CGAffineTransformMakeTranslation(-self.leftWidth * 0.4, 0);
        
    } completion:^(BOOL finished) {
        
        [self.coverBtn removeFromSuperview];
        
    }];
    



}

//遮盖的按钮
- (UIButton *)coverBtn {


    if (_coverBtn == nil) {
        
        
        _coverBtn = [[UIButton alloc] initWithFrame:self.mainVc.view.bounds];
        
        _coverBtn.backgroundColor = [UIColor clearColor];
        
        [_coverBtn addTarget:self action:@selector(didClickCoverBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }

    
    return _coverBtn;


}

@end
