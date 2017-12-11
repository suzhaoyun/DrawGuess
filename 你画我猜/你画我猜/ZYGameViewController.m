//
//  ZYGameViewController.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYGameViewController.h"
#import "ZYDrawView.h"

@interface ZYGameViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet ZYDrawView *drawView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *chooseColorView;
@property (weak, nonatomic) IBOutlet UIView *chooseLineWidthView;

@end

@implementation ZYGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.drawView.drawEable = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - action

- (IBAction)changeColor:(id)sender {
    self.chooseColorView.hidden = !self.chooseColorView.hidden;
}

- (IBAction)changeLineWidth:(id)sender {
    self.chooseLineWidthView.hidden = !self.chooseLineWidthView.hidden;
}

- (IBAction)backClick:(id)sender {
    [self.drawView back];
}

- (IBAction)clearClick:(id)sender {
    [self.drawView clear];
}

- (IBAction)chooseColor:(UIButton *)sender {
    self.drawView.lineColor = sender.backgroundColor;
    self.chooseColorView.hidden = YES;
}

- (IBAction)chooseLineWidth:(UIButton *)sender {
    self.drawView.lineWidth = sender.currentTitle.floatValue;
    self.chooseLineWidthView.hidden = YES;
}

#pragma mark - tableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
