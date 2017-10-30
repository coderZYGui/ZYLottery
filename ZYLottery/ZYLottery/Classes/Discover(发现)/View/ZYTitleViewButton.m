//
//  ZYTitleViewButton.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/29.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYTitleViewButton.h"

@implementation ZYTitleViewButton

// 方法1:
// 调整imageView的位置

/**
 修改Button内部的title的布局
 
 @param contentRect 当前按钮的位置尺寸
 @return 当国内title的位置尺寸
 */
//- (CGRect)titleRectForContentRect:(CGRect)contentRect;

/**
 修改Button内部Image的布局
 
 返回当前按钮当中ImageView的位置尺寸
 contentRect:当前按钮的位置尺寸
*/
//- (CGRect)imageRectForContentRect:(CGRect)contentRect;



// 方法2:
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调用两次LayoutSubviews
//    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    if (self.imageView.x < self.titleLabel.x) {
        
        // 第一次调整子控件的位置
        // 调整label
        self.titleLabel.x = self.imageView.x;
        // 调整imageView
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
        
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
