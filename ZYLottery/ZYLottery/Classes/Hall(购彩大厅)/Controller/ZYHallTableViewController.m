//
//  ZYHallTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYHallTableViewController.h"
#import "UIImage+ZYNotRender.h"
#import "ZYCover.h"
#import "ZYPopMenu.h"
//#import "UIView+ZYFrame.h"

@interface ZYHallTableViewController ()<ZYPopMenuDelegate>

@end

@implementation ZYHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消渲染 iOS7以后,导航条上的图片都会被默认渲染.
    
//    UIImage *image = [[UIImage imageNamed:@"CS50_activity_image"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 创建左视图
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnOnClick)];

    
}

// 点击leftBtn调用
- (void)leftBtnOnClick
{
    // 由谁添加,由谁移除
    
    // 1.弹出蒙版.占据整个屏幕,不允许与用户交互
    [ZYCover show];
    
    //2. 弹出popMenu
    ZYPopMenu *popMenu = [ZYPopMenu showInCenter:self.view.center];
    popMenu.delegate = self;
    
//    popMenu.width = 10;
//    popMenu.height = 20;
//    popMenu.x = 100;
//    popMenu.y = 50;
//    
//    NSLog(@"%@",NSStringFromCGRect(popMenu.frame));
    
//    CGRect frame = popMenu.frame;
//    frame.size.width = 50;
//    popMenu.frame = frame;
    
}

#pragma -mark ZYPopMenuDeleagte

/**
 当点击x按钮调用
 */
- (void)popMenuDidCloseBtn:(ZYPopMenu *)popMenu
{
    // 移除popMenu并设置移除的位置
    [popMenu hideInCenter:CGPointMake(44, 44) completion:^{
        
        // 移除蒙版
        [ZYCover hide];
    }];
    
    
}

/**
 当动画执行执行完后调用
 */
//- (void)coverDidHide:(ZYCover *)cover
//{
//    [ZYCover hide];
//}


@end
