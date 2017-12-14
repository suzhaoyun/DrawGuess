//
//  ZYRoomViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYRoomViewController.h"
#import "ZYGameViewController.h"
#import "ZYSitButton.h"
#import "SocketIOClient+ZY.h"
#import "ZYBussinessManager.h"
#import <MJExtension/MJExtension.h>

@interface ZYRoomViewController ()

@property (weak, nonatomic) IBOutlet UILabel *personLabel;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;

@end

@implementation ZYRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"ZYSu的私人会所";
    
    [[SocketIOClient sharedClient] connectWithTimeoutAfter:30 withHandler:^{
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"你的网也太差了" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil] show];
        [[SocketIOClient sharedClient] connect];
    }];
    
    [[SocketIOClient sharedClient] on:@"connect" callback:^(NSArray * _Nonnull arr, SocketAckEmitter * _Nonnull emitter) {
        NSMutableDictionary *dict = [ZYBussinessManager sharedManager].currentUser.mj_keyValues;
        [dict setObject:[SocketIOClient sharedClient].sid forKey:@"id"];
        [[SocketIOClient sharedClient] emit:@"joinRoom" with:@[dict]];
    }];
    
    [[SocketIOClient sharedClient] on:@"roomPersonChange" callback:^(NSArray * _Nonnull arr, SocketAckEmitter * _Nonnull emitter) {
        
        NSArray *persons = arr.lastObject;
        
        NSString *personsStr = [[persons valueForKeyPath:@"nickname"] componentsJoinedByString:@","];
        self.goBtn.enabled = persons.count == 2;
        self.personLabel.text = [NSString stringWithFormat:@"当前在线：%@", personsStr];
    }];
}

- (IBAction)goClick:(id)sender {
    ZYGameViewController *vc = [ZYGameViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
