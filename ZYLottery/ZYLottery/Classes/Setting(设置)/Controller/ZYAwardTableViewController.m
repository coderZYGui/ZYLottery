//
//  ZYAwardTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYAwardTableViewController.h"

@interface ZYAwardTableViewController ()

@end

@implementation ZYAwardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    
}


/**
 第一组
 */
- (void)setupGroup0
{
    ZYSettingSwitchItem *item = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item.subTitle = @"每天开奖";
    
    ZYSettingSwitchItem *item1 = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item1.subTitle = @"每天开奖";
    
    ZYSettingSwitchItem *item2 = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item2.subTitle = @"每天开奖";
    
    ZYSettingSwitchItem *item3 = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item3.subTitle = @"每天开奖";
    
    ZYSettingSwitchItem *item4 = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item4.subTitle = @"每天开奖";
    
    ZYSettingSwitchItem *item5 = [ZYSettingSwitchItem itemWithTitle:@"双色球"];
    item5.subTitle = @"每天开奖";
    
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:@[
                                                            
                                                            item,
                                                            item1,
                                                            item2,
                                                            item3,
                                                            item4,
                                                            item5
                                                            
                                                            ]];
    [self.groups addObject:group];
    
}

/**
 cell的内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    static NSString *ID = @"cell";
//    
//    ZYSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        cell = [[ZYSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    
    ZYSettingTableViewCell *cell = [ZYSettingTableViewCell cellWithTableView:tableView cellStyle:UITableViewCellStyleSubtitle];
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.f];
    
    // 设置数据
    // 取出组模型
    ZYSettingGroup *group = self.groups[indexPath.section];
    // 取出行模型数据
    ZYSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    
    return cell;
}
    

@end
