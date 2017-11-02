//
//  ZYSettingItem.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYSettingItem.h"

@implementation ZYSettingItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title
{
    ZYSettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    item.title = title;
    
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

@end
