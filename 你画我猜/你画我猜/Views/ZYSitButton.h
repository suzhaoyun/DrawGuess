//
//  ZYSitButton.h
//  你画我猜
//
//  Created by ZYSu on 2017/12/13.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYUserModel;
@interface ZYSitButton : UIButton

@property (nonatomic, strong) ZYUserModel *model;

@property (nonatomic, copy) NSString *sitNumber;

@end
