//
//  ZYArenaViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYArenaViewController.h"

@interface ZYArenaViewController ()

@end

@implementation ZYArenaViewController

// 当第一次加载view的时候调用
// 如果自定义view,重写这个方法
// 一般使用的场景:当控制器的View一显示时,就是一张图片,或者UIWebView.
- (void)loadView
{
    // 在这个方法里面不能调用self.view.bounds,如果调用会造成死循环
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = imageView;
    // 设置背景图片
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    imageView.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置titleView
    UISegmentedControl *segMentControl = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    
    // 2.设置背景图片
    // 普通状态
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 选中状态
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 3.设置字体颜色
    [segMentControl setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName : [UIColor whiteColor]
                                             } forState:UIControlStateNormal];
    
    // 4.设置选中的索引
    segMentControl.selectedSegmentIndex = 0;
    
    // 5.设置前景色(控件默认的颜色)
    segMentControl.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    
    self.navigationItem.titleView = segMentControl;

    
}



@end
