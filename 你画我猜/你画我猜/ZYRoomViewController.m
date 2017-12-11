//
//  ZYRoomViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYRoomViewController.h"
#import "ZYGameViewController.h"

@interface ZYRoomViewController ()

@end

@implementation ZYRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"ZYSu的私人会所";
}

- (IBAction)goClick:(id)sender {
    ZYGameViewController *vc = [ZYGameViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
