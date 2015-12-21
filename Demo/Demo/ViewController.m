//
//  ViewController.m
//  Demo
//
//  Created by ZhangTinghui on 15/12/21.
//  Copyright © 2015年 www.morefun.mobi. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+PullToZoomInTableHeaderView.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)dealloc {
    [self.tableView setTableHeaderView:nil pullToZoomInEnabled:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 200);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    [self.tableView setTableHeaderView:imageView pullToZoomInEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
