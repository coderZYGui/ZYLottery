//
//  ZYNavigationViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYNavigationViewController.h"

@interface ZYNavigationViewController()<UINavigationControllerDelegate>

/** 系统手势代理 */
@property (nonatomic, strong) id popGesture;

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
    
    [bar setTintColor:[UIColor whiteColor]];
    
    // 获取的导航条按钮的标识
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    // 修改返回按钮标题的位置
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad
{
    // 会加载5次viewDidLoad方法. 因此把代码写在 initialize方法中
//    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    [super viewDidLoad];
    
    // 清空手势代理,就可以实现滑动滚动,iOS6不支持
    // 根控制器不可以清空(会出现bug)
//    self.interactivePopGestureRecognizer.delegate = nil;
    
//    self.popGesture = self.interactivePopGestureRecognizer.delegate;
    
    
    // 如果是根控制器,还原手势代理,若不是根控制器,清除手势代理
//    self.delegate = self;
}

#pragma -mark UINavigationControllerDelegate
/**
 当控制器显示完毕的时候调用

 @param navigationController 导航控制器
 @param viewController 栈中的当前控制器
 */
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//
////    NSLog(@"%@",viewController);
//    if (self.viewControllers[0] == viewController) {
//        // 根控制器
//        // 还原代理
//        self.interactivePopGestureRecognizer.delegate = self.popGesture;
//        
//    }else{
//        // 非根控制器
//        // 清空代理
//        self.interactivePopGestureRecognizer.delegate = nil;
//    }
//    
//}

/**
 压入viewController入栈时的方法

 @param viewController 入栈的控制器
 */
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    // 还原系统做法
//    [super pushViewController:viewController animated:animated];
//    // 如果不是根控制器,其他的控制器(viewControllers=1的时候,说明只有根控制器)
//    if (self.viewControllers.count != 1) {
//        
//        // 如果设置左侧统一返回按钮,就没有滑动移除控制器的功能
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
//        
//    }
//}

- (void)back
{
    [self popViewControllerAnimated: YES];
}

@end
