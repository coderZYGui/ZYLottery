//
//  ZYSaveTool.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYSaveTool.h"

@implementation ZYSaveTool

+ (nullable id)objectForKey:(NSString *)anAttribute
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:anAttribute];
}

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    // 立即同步
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
