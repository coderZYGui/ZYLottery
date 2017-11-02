//
//  ZYSettingGroup.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYSettingGroup : NSObject

/** 头部标题 */
@property (nonatomic, copy) NSString *headerTitle;

/** 尾部标题 */
@property (nonatomic, copy) NSString *footerTitle;

/** 行模型数组 */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)groupWithItem:(NSArray *)items;

@end
