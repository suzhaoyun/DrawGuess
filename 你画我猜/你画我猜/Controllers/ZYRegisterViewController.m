//
//  ZYRegisterViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYRegisterViewController.h"
#import "ZYRoomViewController.h"
#import "ZYBussinessManager.h"

@interface ZYRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *mutouBtn;
@property (weak, nonatomic) IBOutlet UIButton *zysuBtn;

@end

@implementation ZYRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"你是？";
    
    self.mutouBtn.layer.cornerRadius = 75;
    self.mutouBtn.layer.masksToBounds = YES;
    
    self.zysuBtn.layer.cornerRadius = 75;
    self.zysuBtn.layer.masksToBounds = YES;
}

- (IBAction)registClick:(id)sender {

    [[ZYBussinessManager sharedManager] setUserId:sender==self.mutouBtn?@"29":@"17"];

    ZYRoomViewController *vc = [ZYRoomViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
