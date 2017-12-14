//
//  ZYDrawView.h
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//  封装画板

#import <UIKit/UIKit.h>

@interface ZYDrawView : UIView

/**
 是否可以作画
 */
@property (nonatomic, assign) BOOL drawEable;

/**
 线的宽度
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 线的颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 清空画布
 */
- (void)clear;

/**
 返回上一步
 */
- (void)back;

/**
 重置所有属性
 */
- (void)reset;

/**
 生成UIImage图片
 */
- (UIImage *)getImage;

@end
