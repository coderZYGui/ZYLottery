//
//  ZYPopMenu.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/27.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

// MyBlock 的类型 void(^)()
typedef void(^MyBlock)(void);

@class ZYPopMenu,ZYCover;

@protocol ZYPopMenuDelegate <NSObject>

// 点击x按钮
- (void)popMenuDidCloseBtn:(ZYPopMenu *)popMenu;

// 动画执行完成后调用
//- (void)coverDidHide:(ZYCover *)cover;

@end

@interface ZYPopMenu : UIView


/**
 显示popMenu

 @param center 显示在什么位置
 @return popMenu
 */
+ (instancetype)showInCenter:(CGPoint)center;

/**
 隐藏popMenu

 @param center 在什么位置隐藏
 @param completion 接收一段传递的block代码
 */
- (void)hideInCenter:(CGPoint)center completion:(MyBlock)completion;

/** 代理属性 */
@property (nonatomic, weak) id<ZYPopMenuDelegate> delegate;

@end
