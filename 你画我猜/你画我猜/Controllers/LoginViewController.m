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
#import <AFNetworking/AFNetworking.h>
#import "ZYBussinessManager.h"
#import <MJExtension/MJExtension.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://192.168.0.76:3000/start" parameters:@{@"userid" : @"1"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
