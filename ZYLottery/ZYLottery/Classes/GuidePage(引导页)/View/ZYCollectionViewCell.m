//
//  ZYCollectionViewCell.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/30.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYCollectionViewCell.h"

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
        
        _startBtn = btn;
        
    }
    return _startBtn;
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
