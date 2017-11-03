//
//  ZYLuckyView.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYLuckyView.h"

@implementation ZYLuckyView


- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
}




@end
