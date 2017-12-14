//
//  ZYBussinessManager.h
//  你画我猜
//
//  Created by ZYSu on 2017/12/13.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYUserModel.h"

@interface ZYBussinessManager : NSObject

+ (instancetype)sharedManager;

- (void)setUserId:(NSString *)userid;

@property (nonatomic, strong) ZYUserModel *currentUser;

@end
