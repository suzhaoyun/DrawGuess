//
//  ZYBussinessManager.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/13.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYBussinessManager.h"

@implementation ZYBussinessManager
+ (instancetype)sharedManager
{
    static ZYBussinessManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[ZYBussinessManager alloc] init];
    });
    return _manager;
}

- (void)setUserId:(NSString *)userid
{
    [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"userid"];
    
    ZYUserModel *model = [ZYUserModel new];
    model.userid = userid;
    model.nickname = [userid isEqualToString:@"17"]?@"ZYSu":@"木头321";
    model.iconname = [userid isEqualToString:@"17"]?@"zysu_icon":@"mutou_icon";
    model.roomName = @"1125";
    [self setCurrentUser:model];
}

- (ZYUserModel *)currentUser
{
    if (_currentUser == nil) {
        
        NSString *userid = [[NSUserDefaults standardUserDefaults] stringForKey:@"userid"];
        if (userid.length) {
            ZYUserModel *model = [ZYUserModel new];
            model.userid = userid;
            model.nickname = [userid isEqualToString:@"17"]?@"ZYSu":@"木头321";
            model.iconname = [userid isEqualToString:@"17"]?@"zysu_icon":@"mutou_icon";
            model.roomName = @"1125";
            _currentUser = model;
        }
    }
    return _currentUser;
}

@end
