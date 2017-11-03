//
//  ZYLuckyViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYLuckyViewController.h"

@interface ZYLuckyViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *lightImage;

@end

@implementation ZYLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //image动画组，可以实现简单额动画，原理就是来回切换图片
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 =[UIImage imageNamed:@"lucky_entry_light1"];
    self.lightImage.animationImages = @[image,image1];
    self.lightImage.animationDuration = 1;
    [self.lightImage startAnimating];
    
}

- (IBAction)rotaryButton:(UIButton *)button {
    
    
    
}


@end
