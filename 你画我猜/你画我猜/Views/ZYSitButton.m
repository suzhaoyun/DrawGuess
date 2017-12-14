//
//  ZYSitButton.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/13.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYSitButton.h"
#import "ZYUserModel.h"

@implementation ZYSitButton

- (void)setModel:(ZYUserModel *)model
{
    _model = model;
    
    if (model) {
        [self setTitle:model.nickname forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:model.iconname] forState:UIControlStateNormal];
    }else{
        [self setTitle:@"坐下" forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    self.titleLabel.frame = self.bounds;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self bringSubviewToFront:self.titleLabel];
}

@end
