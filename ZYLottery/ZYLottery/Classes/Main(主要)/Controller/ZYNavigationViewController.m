//
//  ZYNavigationViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYNavigationViewController.h"

@interface ZYNavigationViewController()

@end

@implementation ZYNavigationViewController



/**
 当程序一启动的时候就会调用
    作用: 将当前类加载进内存,放在代码区
    因为load方法 先于 main方法 执行,因此不使用这个方法
 */
//+ (void)load
//{
//    
//}

/**
 什么时候调用: 当第一次初始化这个类的时候调用
    作用: 初始化这个类.并且只会调用一次
 */
+ (void)initialize
{
//    NSLog(@"%s",__func__);
    
    // 获取导航条标识(当调用apperance协议方法,整个app的导航栏都为 下面设置的样式)
    // 如果这样写会导致不可以为某个导航控制器设置唯一的导航栏内容
//    UINavigationBar *bar = [UINavigationBar appearance];
    
    // 回去某几个类的导航条标识(只要是ZYNavigationViewController类型的导航控制器,其导航条样式都相同.
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[ZYNavigationViewController class]]];
    
    // 类方法中不可以访问成员变量
    // 设置导航条的背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 设置导航栏文字属性
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    
    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:21];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dictM];
    
}

- (void)viewDidLoad
{
    // 会加载5次viewDidLoad方法. 因此把代码写在 initialize方法中
//    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
}

@end
