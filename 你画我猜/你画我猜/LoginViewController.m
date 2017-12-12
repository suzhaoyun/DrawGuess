//
//  LoginViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/12.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "LoginViewController.h"
#import "ZYRoomViewController.h"
#import "SocketIOClient+ZY.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [[SocketIOClient sharedClient] connectWithTimeoutAfter:30 withHandler:^{
//        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"你的网也太差了" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil] show];
//    }];
    [[SocketIOClient sharedClient] connect];

    [[SocketIOClient sharedClient] on:@"connect" callback:^(NSArray * _Nonnull arr, SocketAckEmitter * _Nonnull emitter) {
        [UIApplication sharedApplication].delegate.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ZYRoomViewController new]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
