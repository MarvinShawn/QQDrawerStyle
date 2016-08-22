//
//  XYIconView.m
//  仿QQ的抽屉效果
//
//  Created by ww on 16/5/30.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYIconView.h"

@implementation XYIconView


+ (instancetype)iconView {

    return [[[NSBundle mainBundle] loadNibNamed:@"XYIconView" owner:nil options:nil] lastObject];
}


@end
