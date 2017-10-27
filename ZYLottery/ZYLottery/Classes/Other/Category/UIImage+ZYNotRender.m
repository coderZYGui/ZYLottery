//
//  UIImage+ZYNotRender.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "UIImage+ZYNotRender.h"

@implementation UIImage (ZYNotRender)

/**
 给一个图片名称返回一张不渲染的图片

 @param name 图片名称
 @return 返回一张图片
 */
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
