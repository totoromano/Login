//
//  HomeViewController.m
//  Login
//
//  Created by Dev on 10/24/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>

@interface HomeViewController ()

@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    if([PFUser currentUser]){
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)login:(UIButton *)sender {
    if([PFUser currentUser]){
        [self performSegueWithIdentifier:@"loggedInUser" sender:self];
    }else{
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (IBAction)signup:(id)sender {
    
    [UIView animateWithDuration:1.5
                          delay:2.0
                        options:UIViewAnimationOptionCurveLinear // See other options
                     animations:^{
                         [self.view setAlpha:0.3];//:0.3];
                     }
                     completion:^(BOOL finished) {
                         // Completion Block
                         [self performSegueWithIdentifier:@"requestSignup" sender:self];
                     }];
}
@end
