//
//  InfoViewController.m
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "InfoViewController.h"
#import <Parse/Parse.h>

@interface InfoViewController ()

@end

@implementation InfoViewController

-(void)viewDidAppear:(BOOL)animated{
   // NSLog(@"ViewDidAppear");
        
}
-(void)viewDidDisappear:(BOOL)animated{
   // NSLog(@"viewDidDisappear");
}

-(void)viewWillAppear:(BOOL)animated{
    // NSLog(@"viewWillAppear");
}

-(void) setup{
    self.textLabel.text = (NSString *)[[PFUser currentUser] username] ;
}

- (void)viewDidLoad {
    //NSLog(@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // NSLog(@"username: %s",[[[PFUser currentUser]username] UTF8String]);
    //self.textLabel.text = [[[PFUser currentUser] username] UTF8String] ;
   // NSLog(@"username: %s",[[[PFUser currentUser]username] UTF8String]);
    [self setup];
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

-(UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier{
   // NSLog(@"Over HEre");
    
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    // Set the target point for the animation to the center of the button in this VC
    return segue;
}


- (IBAction)logout:(UIButton *)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"logout" sender:self];
    //[self.tabBarController setSelectedIndex:0];
}
@end
