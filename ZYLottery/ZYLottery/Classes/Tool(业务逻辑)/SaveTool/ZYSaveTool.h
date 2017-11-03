//
//  ZYSaveTool.h
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//  存储工具类

#import <Foundation/Foundation.h>

@interface ZYSaveTool : NSObject

+ (nullable id)objectForKey:(NSString *_Nullable)anAttribute;

+ (void)setObject:(nullable id)value forKey:(NSString *_Nullable)defaultName;


@end
