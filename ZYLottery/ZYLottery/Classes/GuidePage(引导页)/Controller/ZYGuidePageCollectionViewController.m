//
//  ZYGuidePageCollectionViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/30.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYGuidePageCollectionViewController.h"
#import "ZYCollectionViewCell.h"

@interface ZYGuidePageCollectionViewController ()

/** 上一次的偏移量 */
@property (nonatomic, assign) CGFloat lastOffestX;

/** 图形 */
@property (nonatomic, weak) UIImageView *ball;
/** 底部大标题 */
@property (nonatomic, weak) UIImageView *guideLargeTextImageView;
/** 底部小标题 */
@property (nonatomic, weak) UIImageView *guideSmallTextImageView;

@end

@implementation ZYGuidePageCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


/**
 重写init方法

 @return 返回一个带有流水布局的CollectionView
 */
- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    // 每一行的间距
    flowLayout.minimumLineSpacing = 0;
    // 每一个item的间距
    flowLayout.minimumInteritemSpacing = 0;
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 修改每一组的边距(上右下左)
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
    return [super initWithCollectionViewLayout:flowLayout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.collectionView 在 self.view上
//    self.view.backgroundColor = [UIColor blueColor];
    self.collectionView.backgroundColor = [UIColor greenColor];
//    self.collectionView.width  = 100;
//    self.collectionView.x = 100;
//    self.collectionView.y = 100;
//    self.collectionView.height = 100;
   
    // 注册cell
    [self.collectionView registerClass:[ZYCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 分页效果
    self.collectionView.pagingEnabled = YES;
    // 隐藏水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    
    // 添加内容
    //1. 添加图片
    //2. 添加到 collectionView上.(不能添加到cell上)
    [self setupAddChildImageView];
    
}

- (void)setupAddChildImageView
{
    //1. 线
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    guideLine.x -= 150;
    
    //2. 球
    UIImageView *ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:ball];
    ball.x += 50;
    self.ball = ball;
    
    //3. 大标题
    UIImageView *guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText];
    // 为了适应任何机型,height弄一个比例
    guideLargeText.center = CGPointMake(self.view.width / 2, self.view.height * 0.7f );
    self.guideLargeTextImageView = guideLargeText;
    
    //4. 小标题
    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.center = CGPointMake(self.view.width / 2, self.view.height * 0.8f );
    self.guideSmallTextImageView = guideSmallText;
}

/**
 滑动减速的时候调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 平移一个宽度
    
    // 总平移量
    CGFloat offsetX = scrollView.contentOffset.x;
//    NSLog(@"offsetX = %lf",offsetX);
    
    // 计算一个偏移量
    CGFloat oneOffset = offsetX - self.lastOffestX;
//    NSLog(@"oneOffset = %lf",oneOffset);
    

    
    // 切换图片
    // 计算页码
    NSInteger page = offsetX / oneOffset;
    NSString *imageName = [NSString stringWithFormat:@"guide%ld",page + 1];
    self.ball.image = [UIImage imageNamed:imageName];
    
    // 大标题
    NSString *largeTextName = [NSString stringWithFormat:@"guideLargeText%ld",page];
    UIImage *largeTextImage = [UIImage imageNamed:largeTextName];
    self.guideLargeTextImageView.image = largeTextImage;
    
    // 小标题
    NSString *smallTextName = [NSString stringWithFormat:@"guideSmallText%ld",page];
    UIImage *smallTextImage = [UIImage imageNamed:smallTextName];
    self.guideSmallTextImageView.image = smallTextImage;
    
    // 偏移子控件
    self.ball.x += oneOffset * 2;
    self.guideLargeTextImageView.x += oneOffset * 2;
    self.guideSmallTextImageView.x += oneOffset * 2;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.ball.x -= oneOffset;
        self.guideLargeTextImageView.x -= oneOffset;
        self.guideSmallTextImageView.x -= oneOffset;
    }];
    
    // 记录上一次偏移量
    self.lastOffestX = offsetX;
    //    NSLog(@"lastOffestX = %lf",self.lastOffestX);
    
}

#pragma -mark UICollectionView 数据源方法

/**
 有多少组数据
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#define ZYPage 4
/**
 每一组有多少个item(类似于cell)
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return ZYPage;
}

/**
 每个item显示的内容
 
 @param indexPath 每个item的索引
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 如果缓存池中有,就从缓存池中取
   ZYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // 如果没有,就创建
//    if (cell == nil) {
//        cell = [[UICollectionViewCell alloc] init];
//    }

    cell.backgroundColor = [UIColor blueColor];
    
    //cell 创建出来就有imageView
    
    // 创建image
    // 拼接图片名
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    
    cell.image = image;
    
//    NSLog(@"%@",cell);
    
    [cell setIndexPath:indexPath count:ZYPage];
    

    
    
    return cell;
}

@end
