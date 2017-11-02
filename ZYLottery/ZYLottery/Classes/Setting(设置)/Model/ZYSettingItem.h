//
//  ZYSettingItem.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

//typedef enum : NSUInteger {
//    
//    ZYSettingItemRightViewStateNone,
//    ZYSettingItemRightViewStateArrow,
//    ZYSettingItemRightViewStateSwitch,
//    
//} ZYSettingItemRightViewState;


#import <Foundation/Foundation.h>

@interface ZYSettingItem : NSObject

/** 图片 */
@property (nonatomic, strong) UIImage *icon;
/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 子标题 */
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

/** 右侧视图 */
//@property (nonatomic, assign) NSUInteger type;

/** 是否开关 */
//@property (nonatomic, assign, getter=isOn) BOOL on;

/** 点击cell要做的事情 */
@property (nonatomic, copy) void(^OperationBlock)(NSIndexPath *indexPath);


@end
