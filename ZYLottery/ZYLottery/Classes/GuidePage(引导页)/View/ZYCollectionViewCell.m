//
//  ZYCollectionViewCell.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/30.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYCollectionViewCell.h"
#import "ZYTabBarVC.h"

@interface ZYCollectionViewCell()

/** 背景图片 */
@property (nonatomic, weak) UIImageView *bgImageView;

/** 立即添加按钮 */
@property (nonatomic, weak) UIButton *startBtn;

@end

@implementation ZYCollectionViewCell

- (UIButton *)startBtn
{
    if (!_startBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.width / 2, self.height * 0.9);
        [self.contentView addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _startBtn = btn;
        
    }
    return _startBtn;
}

- (void)btnClick:(UIButton *)button
{
//    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    // 切换主界面
    // 切换界面的方式: 1.push  2.TarBarVC  3.modal
    // 方式1和2: 必须要有导航控制器或标签控制器
    // 方式3: 使用modal,modal内部有一个强指针(window)引用着, 引导页不会在内存中不会被销毁.
    
    // 引导页只有在安装app后,或者版本更新的时候 才出现.
    // 切换window的根控制器
    ZYTabBarVC *tabBarVC = [[ZYTabBarVC alloc] init];
    ZYKeyWindow.rootViewController = tabBarVC;
}

// 懒加载
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:imageView];
        _bgImageView = imageView;
    }
    return _bgImageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.bgImageView.image = image;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count
{
    if (indexPath.item == count - 1) {
        // 最后一个cell
        // 当时最后一个cell添加 立即添加按钮
        // 默认button是隐藏的
        self.startBtn.hidden = NO;
//        BOOL flag = self.startBtn.hidden;
//        NSLog(@"%d",flag);
        
    }else{
        // 不是最后一个cell
        self.startBtn.hidden = YES;
    }
}

@end
