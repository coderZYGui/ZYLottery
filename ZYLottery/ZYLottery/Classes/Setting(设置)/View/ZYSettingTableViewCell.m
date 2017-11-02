//
//  ZYSettingTableViewCell.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYSettingTableViewCell.h"

@implementation ZYSettingTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle
{
    static NSString *ID = @"cell";
    
    ZYSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[ZYSettingTableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:ID];
    }
    
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
}

- (void)setItem:(ZYSettingItem *)item
{
    _item = item;
    
    self.imageView.image = item.icon;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    // 设置右边View
    [self setupRightView];

}

/**
 设置右侧View
 */
- (void)setupRightView
{
    if ([_item isKindOfClass:[ZYSettingArrowItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else if ([_item isKindOfClass:[ZYSettingSwitchItem class]]){
        
        // 强制类型转换
        ZYSettingSwitchItem *swItem = (ZYSettingSwitchItem *)_item;
        
        UISwitch *sw = [[UISwitch alloc] init];
        self.accessoryView = sw;
        sw.on = swItem.isOn;
        
    }else{
        self.accessoryView = nil;
    }
}

@end
