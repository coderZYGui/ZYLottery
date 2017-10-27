//
//  ZYPopMenu.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/27.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYPopMenu.h"
#import "ZYCover.h"
#define ZYKeyWindow [UIApplication sharedApplication].keyWindow

@implementation ZYPopMenu


/**
 点击x号按钮时调用
 */
- (IBAction)removeBtn:(UIButton *)sender {
    
    // 通知代理点击了x按钮
    if ([self.delegate respondsToSelector:@selector(popMenuDidCloseBtn:)]) {
        [self.delegate popMenuDidCloseBtn:self];
    }
    
}

/**
 显示PopMenu
 
 @param center 显示的位置
 */
+ (instancetype)showInCenter:(CGPoint)center
{
    UIView *popMenu = [[[NSBundle mainBundle] loadNibNamed:@"ZYPopMenu" owner:nil options:nil] lastObject];
    popMenu.center = center;
    
    [ZYKeyWindow addSubview:popMenu];
    
    return popMenu;
}

/**
 移除PopMenu
 
 @param center 在哪个位置移除
 */
- (void)hideInCenter:(CGPoint)center completion:(MyBlock)completion
{
    // 移除popMenu
    [UIView animateWithDuration:0.5 animations:^{
        self.center = center;
        self.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
    } completion:^(BOOL finished) {
        // 移除自己
        [self removeFromSuperview];
        
        // 移除蒙版
        //方法1: [ZYCover hide]; // 这种方式和popMenu耦合性太大
        
        //方法2: 使用代理
//        if ([self.delegate respondsToSelector:@selector(coverDidHide:)]) {
//            [self.delegate coverDidHide:[[ZYCover alloc] init]];
//        }
        
        //方法3: 使用block保存一段代码作为参数传递
        if (completion != nil) {
            
            completion();
            
        }
        
    }];
}



@end
