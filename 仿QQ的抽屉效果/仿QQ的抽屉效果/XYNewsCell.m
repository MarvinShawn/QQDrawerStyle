//
//  XYNewsCell.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#define MAS_SHORTHAND


#define MAS_SHORTHAND_GLOBALS

#import "XYNewsCell.h"
#import "Masonry.h"
#import "XYNews.h"

@interface XYNewsCell ()

@property (nonatomic,weak) UIImageView *iconView;

@property (nonatomic,weak) UILabel *linkMenName;

@property (nonatomic,weak) UILabel *newsLbl;


@end

@implementation XYNewsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setup];
        
    }
    
    return  self;


}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    if(self = [super initWithCoder:aDecoder]) {
        
        [self setup];
    }
    
    return  self;

}


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setup];

    }
    
    return  self;

}


//创建控件
- (void)setup {

    //头像
    UIImageView *iconView = [[UIImageView alloc] init];
    
    self.iconView = iconView;
    
    [self.contentView addSubview:iconView];
    
    //联系人名
    UILabel *linkMenName = [[UILabel alloc] init];
    
    linkMenName.font = [UIFont systemFontOfSize:15];
    
    self.linkMenName = linkMenName;
    
    [self.contentView addSubview:linkMenName];
    
    //消息预览
    UILabel *newsLbl = [[UILabel alloc] init];
    
    newsLbl.font = [UIFont systemFontOfSize:13];
    
    self.newsLbl = newsLbl;
    
    [self.contentView addSubview:newsLbl];

}

//布局子控件
- (void)layoutSubviews {

    [super layoutSubviews];
    
    //用第三方框架约
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(5);
        
        make.centerY.offset(0);
        
        make.width.offset(40);
        
        make.height.offset(40);
        
    }];
    
    
    [self.linkMenName makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconView.right).offset(5);
        
        make.top.equalTo(self.iconView.top);
    }];
    
    [self.newsLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.linkMenName.left);
        
        make.bottom.equalTo(self.iconView.bottom);
        
    }];


}



- (void)setNews:(XYNews *)news {

    _news = news;
    
    if (news.icon) {
        
         self.iconView.image = [UIImage imageNamed:news.icon];
    }
   
    
    self.linkMenName.text = news.name;
    
    self.newsLbl.text = news.news;

}

- (void)setPhoneNews:(NSString *)phoneNews {

    _phoneNews = phoneNews;
    
    
    self.linkMenName.text = phoneNews;
    
    self.iconView.image = nil;
    
    self.newsLbl.text = nil;



}

@end
