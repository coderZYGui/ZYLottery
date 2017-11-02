//
//  ZYSettingGroup.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYSettingGroup.h"

@implementation ZYSettingGroup

+ (instancetype)groupWithItem:(NSArray *)items
{
    ZYSettingGroup *group = [[ZYSettingGroup alloc] init];
    
    group.items = items;
    
    return group;
}

@end
