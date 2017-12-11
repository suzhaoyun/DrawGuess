//
//  ZYRegisterViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYRegisterViewController.h"
#import "ZYRoomViewController.h"

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
    [[NSUserDefaults standardUserDefaults] setObject:sender==self.mutouBtn?@"13161126199":@"18801017128" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    ZYRoomViewController *vc = [ZYRoomViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
