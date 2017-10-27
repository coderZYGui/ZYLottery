//
//  ZYCover.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYCover.h"
#define ZYKeyWindow [UIApplication sharedApplication].keyWindow

@implementation ZYCover

+ (void)show
{
    // 创建蒙版
    ZYCover *cover = [[ZYCover alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
//    cover.alpha = 0.7;
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    // 把蒙版添加到window上
    [ZYKeyWindow addSubview:cover];
    
    // 因为父类设置alpha, 子类也会跟着透明
    
}

+ (void)hide
{
    for (UIView *view in ZYKeyWindow.subviews) {
        if ([view isKindOfClass:[self class]]) {
            // 当前类
            [view removeFromSuperview];
            break;
        }
    }
}

@end
