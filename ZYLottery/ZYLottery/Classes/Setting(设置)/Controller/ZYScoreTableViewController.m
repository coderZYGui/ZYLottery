//
//  ZYScoreTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYScoreTableViewController.h"

@interface ZYScoreTableViewController ()

@end

@implementation ZYScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    
    [self setupGroup1];
    
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
    
}

/**
 第0组
 */
- (void)setupGroup0
{
    ZYSettingSwitchItem *item = [ZYSettingSwitchItem itemWithTitle:@"关注比赛"];
    // 添加到组模型中
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:@[item]];
    
    [self.groups addObject:group];
    
}

/**
 第1组
 */
- (void)setupGroup1
{
    ZYSettingItem *item = [ZYSettingItem itemWithTitle:@"起始时间"];
    // 添加到组模型中
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:@[item]];
    item.subTitle = @"00:00";
    
    [self.groups addObject:group];
}

/**
 第2组
 */
- (void)setupGroup2
{
    ZYSettingItem *item = [ZYSettingItem itemWithTitle:@"结束时间"];
    // 添加到组模型中
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:@[item]];
    item.subTitle = @"24:00";
    
    // 在iOS7以后只要把TextFiled添加到cell 上就能实现自动计算高度,自动调整cell的位置
    //        __weak typeof(self) weakSelf = self;
    __unsafe_unretained typeof(self) weakSelf = self;
    item.OperationBlock = ^(NSIndexPath *indexPath){
        
        // 获取cell的方法
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        UITextField *textField = [[UITextField alloc] init];
        [cell addSubview:textField];
        
        [textField becomeFirstResponder];
        
    };
    
    [self.groups addObject:group];
}

/**
 当scrollView开始滑动的时候
 */
// 当滑动的时候退出键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
