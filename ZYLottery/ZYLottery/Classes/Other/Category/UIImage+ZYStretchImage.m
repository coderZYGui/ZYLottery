//
//  UIImage+ZYStretchImage.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/29.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "UIImage+ZYStretchImage.h"

@implementation UIImage (ZYStretchImage)

/**
 返回一张拉伸的图片
 
 @param localImageName 图片名
 */
+ (instancetype)resizableImageWithLocaImageName:(NSString *)localImageName
{
    // 创建图片
    UIImage *image = [UIImage imageNamed:localImageName];
    // 获取图片的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    return [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
}

@end
