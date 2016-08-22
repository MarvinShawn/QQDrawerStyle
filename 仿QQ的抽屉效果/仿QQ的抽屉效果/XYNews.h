//
//  XYNews.h
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYNews : NSObject

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *news;


- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)newsWithDIc:(NSDictionary *)dic;


+ (NSArray *)newsInfo;

@end
