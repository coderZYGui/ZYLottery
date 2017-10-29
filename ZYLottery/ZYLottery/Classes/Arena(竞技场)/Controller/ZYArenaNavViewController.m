//
//  ZYArenaNavViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/29.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYArenaNavViewController.h"

@interface ZYArenaNavViewController ()

@end

@implementation ZYArenaNavViewController

+ (void)initialize
{
    //1. 获取导航条标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    //2. 设置导航条背景图片
    //2.1 拉伸图片
    UIImage *image = [UIImage resizableImageWithLocaImageName:@"NLArenaNavBar64"];
    
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImage *image = [UIImage resizableImageWithLocaImageName:@"NLArenaNavBar64"];
//    
//    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}


@end
