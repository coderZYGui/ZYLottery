//
//  ZYBaseTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYBaseTableViewController.h"

@interface ZYBaseTableViewController ()

@end

@implementation ZYBaseTableViewController

// 懒加载
- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 1.取出行模型数组
    ZYSettingGroup *group = self.groups[section];
    
    return group.items.count ;
}


/**
 cell的内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZYSettingTableViewCell *cell = [ZYSettingTableViewCell cellWithTableView:tableView];
    
    // 设置数据
    // 取出组模型
    ZYSettingGroup *group = self.groups[indexPath.section];
    // 取出行模型数据
    ZYSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    
    return cell;
}

/**
 选中cell的时候调用
 @param indexPath cell的索引
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 获取组模型
    ZYSettingGroup *group = self.groups[indexPath.section];
    // 获取行模型
    ZYSettingItem *item = group.items[indexPath.row];
    
    // 跳转和显示内容 只能操作一个
    if (item.OperationBlock) {
        // 调用
        item.OperationBlock(indexPath);
        
        // 当是箭头模型的时候,具有跳转功能
    }else if ([item isKindOfClass:[ZYSettingArrowItem class]]) {
        // 跳转
        ZYSettingArrowItem *arrowItem = (ZYSettingArrowItem *)item;
        
        if (arrowItem.destVC != nil) {
            
            UIViewController *vc = [[arrowItem.destVC alloc] init];
            // 设置导航条title为模型的title
            vc.navigationItem.title = item.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)dealloc
{
//    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

/**
 组头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ZYSettingGroup *group = self.groups[section];
    
    return group.headerTitle;
}

/**
 组尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ZYSettingGroup *group = self.groups[section];
    
    return group.footerTitle;
}


@end
