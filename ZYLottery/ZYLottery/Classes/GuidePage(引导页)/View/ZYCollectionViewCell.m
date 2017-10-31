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

@end

@implementation ZYCollectionViewCell

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

@end
