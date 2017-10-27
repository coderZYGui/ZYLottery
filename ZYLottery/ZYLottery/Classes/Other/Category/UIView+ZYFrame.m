//
//  UIView+ZYFrame.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/27.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "UIView+ZYFrame.h"

@implementation UIView (ZYFrame)

// getter方法
- (CGFloat)width
{
    return self.frame.size.width;
}

// setter方法
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}


- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

@end
