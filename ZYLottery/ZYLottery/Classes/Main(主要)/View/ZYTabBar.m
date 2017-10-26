//
//  ZYTabBar.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYTabBar.h"
#import "ZYTabBarButton.h"

@interface ZYTabBar()

/** 记录当前选中的按钮 */
@property (nonatomic, strong) UIButton *selectBtn;

@end

@implementation ZYTabBar

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//          此时 self.count中没值
//        for (int i = 0; i < self.count; ++i) {
//
//        }
//    }
//    return self;
//}

//- (void)setCount:(NSInteger)count
//{
//    _count = count;
//    for (int i = 0; i < self.count; ++i) {
//        // 添加子控件
//        UIButton *button = [[UIButton alloc] init];
//        [self addSubview:button];
////        button setImage:(nullable UIImage *) forState:(UIControlState)
//    }
//}

- (void)setItemArray:(NSArray *)itemArray
{
    _itemArray = itemArray;
    for (int i = 0; i < self.itemArray.count; ++i) {
        // 添加子控件
        UIButton *button = [[ZYTabBarButton alloc] init];
        [self addSubview:button];
        
        // 取出模型数组中的所有模型
        UITabBarItem *tabBarItem = self.itemArray[i];
        
        // 设置子控件内容
        [button setBackgroundImage:tabBarItem.image forState:UIControlStateNormal];
        [button setBackgroundImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
}


/**
 当按钮点击的时候调用
 */
- (void)btnClick:(UIButton *)button
{
    //1. 取消上次选中
    self.selectBtn.selected = NO;
    
    //2. 选中当前点击的按钮
    button.selected = YES;
    
    //3. 记录当前选中的按钮
    self.selectBtn = button;
    
}

// 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    
    // 取出所有子控件
    int i = 0;
    for (UIButton *button in self.subviews) {
        
        buttonX = buttonW * i;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        i++;
        
    }
    
}

@end
