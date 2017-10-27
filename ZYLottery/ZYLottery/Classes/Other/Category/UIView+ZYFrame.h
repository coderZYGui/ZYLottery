//
//  UIView+ZYFrame.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/27.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZYFrame)

/*
    分类中不可以定义成员属性,但是 @property 在分类中定义,
        只会生产get,set方法,不会生成下划线开头的私有成语属性
 */

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@end
