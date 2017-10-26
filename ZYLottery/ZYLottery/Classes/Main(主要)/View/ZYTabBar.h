//
//  ZYTabBar.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/26.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYTabBar;
@protocol ZYTabBarDelegate <NSObject>

- (void)tabBar:(ZYTabBar *)tabBar index:(NSInteger)index;

@end

@interface ZYTabBar : UIView


/** 模型数组 */
@property (nonatomic, strong) NSArray *itemArray;

@property (nonatomic, weak) id<ZYTabBarDelegate> delegate;

@end
