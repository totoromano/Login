//
//  PushedViewController.m
//  Login
//
//  Created by Dev on 10/23/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "PushedViewController.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
    self.title = [_container objectAtIndex:0];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = [_container objectAtIndex:0];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationItem setHidesBackButton:YES animated:NO];// = nil;
    
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

- (IBAction)manualBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
