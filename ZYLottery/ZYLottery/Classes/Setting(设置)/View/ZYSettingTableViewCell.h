//
//  ZYSettingTableViewCell.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYSettingItem.h"
#import "ZYSettingGroup.h"
#import "ZYSettingArrowItem.h"
#import "ZYSettingSwitchItem.h"

@interface ZYSettingTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle;

/** 模型 */
@property (nonatomic, strong) ZYSettingItem *item;

@end
