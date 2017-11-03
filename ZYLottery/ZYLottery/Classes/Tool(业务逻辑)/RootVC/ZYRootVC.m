//
//  ZYRootVC.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#define ZYVersion @"version"
#import "ZYRootVC.h"
#import "ZYTabBarVC.h"
#import "ZYGuidePageCollectionViewController.h"
#import "ZYSaveTool.h"

@implementation ZYRootVC

+ (UIViewController *)chooseWindowRootViewController
{
    UIViewController *rootView;
    
    // 当有版本更新,或者第一次安装的时候显示新特性界面.
    //1. 获取当前的版本号
    NSString *currVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //2. 获取上一次版本号
    //    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:ZYVersion];
    
    NSString *lastVersion = [ZYSaveTool objectForKey:ZYVersion];
    
    // 如果当前版本号 > 历史版本号,则进入新特性界面
    if (![currVersion isEqualToString:lastVersion]) {
        // 新特性界面
        rootView = [[ZYGuidePageCollectionViewController alloc] init];
        
        //        // 存储当前版本号
        //        [[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:ZYVersion];
        //        // 立即同步
        //        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [ZYSaveTool setObject:currVersion forKey:ZYVersion];
        
    }else{
        // 进入主框架
        rootView = [[ZYTabBarVC alloc] init];
        
    }
    
//        NSLog(@"%@",NSHomeDirectory());
    
    return rootView;
}

@end
