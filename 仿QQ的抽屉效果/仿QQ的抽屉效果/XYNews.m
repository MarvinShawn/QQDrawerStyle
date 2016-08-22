//
//  XYNews.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/6/1.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYNews.h"

@implementation XYNews


- (instancetype)initWithDic:(NSDictionary *)dic {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    
    
    return self;
}

+ (instancetype)newsWithDIc:(NSDictionary *)dic {
    
    
    return [[self alloc]initWithDic:dic];
    
}

+ (NSArray *)newsInfo {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"news.plist" ofType:nil];
    
    NSArray *infoArr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithCapacity:infoArr.count];
    
    [infoArr enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        XYNews *news = [XYNews newsWithDIc:dict];
        
        [tmpArr addObject:news];
        
    }];


    return tmpArr.copy;

}
@end
