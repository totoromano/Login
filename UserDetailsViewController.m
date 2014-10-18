//
//  UserDetailsViewController.m
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "UserDetailsViewController.h"
#import <Parse/Parse.h>

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController
-(void)viewDidAppear:(BOOL)animated{
    
    if(![PFUser currentUser]){
        [self performSegueWithIdentifier:@"RequestLogIn" sender:self];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.usernameLabel.text = [[PFUser currentUser] objectForKey:@"username"];
    self.emailLabel.text = [[PFUser currentUser]objectForKey:@"email"];
    self.idLabel.text = [[PFUser currentUser] objectId];
    
    NSArray *follows = [PFUser currentUser][@"follows"];
    NSString *content = @"";
    
    for(int i =0; i < follows.count; i ++){
        content = [content stringByAppendingString:[NSString stringWithFormat:@"%@ \n",[follows objectAtIndex:i]]];
    }
    self.followsLabel.text = content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSLog(@"The current user is: %s\n", [[[PFUser currentUser]description]UTF8String]);
    
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

- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"RequestLogIn" sender:self];
}
@end
