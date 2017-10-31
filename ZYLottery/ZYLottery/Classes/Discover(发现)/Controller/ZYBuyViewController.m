//
//  ZYBuyViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/29.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYBuyViewController.h"
#import "ZYTitleViewButton.h"

@interface ZYBuyViewController ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation ZYBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[ZYTitleViewButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    // 自适应按钮尺寸
    [button sizeToFit];
    
    self.button = button;
    
    self.navigationItem.titleView = button;
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
    
}

//- (void)back
//{
//    [self.navigationController popViewControllerAnimated: YES];
//}

// 封装标题按钮

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.button setTitle:@"朝阳彩种朝阳彩种" forState:UIControlStateNormal];
    [self.button setImage:nil forState:UIControlStateNormal];
    
}

@end
