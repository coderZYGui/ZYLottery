//
//  ZYPushTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYPushTableViewController.h"

#import "ZYSettingItem.h"
#import "ZYSettingGroup.h"
#import "ZYSettingArrowItem.h"
#import "ZYSettingSwitchItem.h"
#import "ZYSettingTableViewCell.h"

#import "ZYScoreTableViewController.h"
#import "ZYAwardTableViewController.h"

@interface ZYPushTableViewController ()

@end

@implementation ZYPushTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    
}

- (void)setupGroup0
{
    
    ZYSettingArrowItem *item = [ZYSettingArrowItem itemWithTitle:@"开奖推送"];
    item.destVC = [ZYAwardTableViewController class];
    
    ZYSettingArrowItem *item1 = [ZYSettingArrowItem itemWithTitle:@"比分直播"];
    item1.destVC = [ZYScoreTableViewController class];
    
    ZYSettingArrowItem *item2 = [ZYSettingArrowItem itemWithTitle:@"中奖动画"];
    
    ZYSettingArrowItem *item3 = [ZYSettingArrowItem itemWithTitle:@"购彩大厅"];
    
    // 把行模型数组放到组模型中
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:@[
                                                            
                                                            item,
                                                            item1,
                                                            item2,
                                                            item3
                                                            
                                                            ]];
    
    // 把组模型放到 组模型数组中
    [self.groups addObject:group];
}


@end
