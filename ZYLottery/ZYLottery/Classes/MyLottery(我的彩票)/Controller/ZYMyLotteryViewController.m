//
//  ZYMyLotteryViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYMyLotteryViewController.h"

@interface ZYMyLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *redBtn;

@end

@implementation ZYMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1 获取redBtn当前的背景图片
    UIImage *image = self.redBtn.currentBackgroundImage;
    
    //2 根据背景图片获得一张不拉伸的图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    //3 重新设置redBtn的背景图片
    [self.redBtn setBackgroundImage:image forState: UIControlStateNormal];
    
    
    // 设置导航栏左侧按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    // 自适应btn尺寸
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 设置右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"Mylottery_config"] style:0 target:self action:@selector(config)];
    
    
    
}

- (void)config
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}


@end
