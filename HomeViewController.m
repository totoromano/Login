//
//  HomeViewController.m
//  Login
//
//  Created by Dev on 10/24/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomSegue.h"
#import <Parse/Parse.h>

@interface HomeViewController ()

@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    if([PFUser currentUser]){
        [self dismissViewControllerAnimated:NO completion:nil];
       // NSLog(@"Dismissing to %s",[[[self.view superview]  description]UTF8String]);
    }
    //NSLog(@"%s",[[[[UIApplication sharedApplication]windows] description]UTF8String]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (IBAction)unwindToRed:(UIStoryboardSegue *)unwindSegue{
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    // Instantiate a new CustomUnwindSegue
    CustomSegue *segue = [[CustomSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    // Set the target point for the animation to the center of the button in this VC
    return segue;
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)login:(UIButton *)sender {
    if([PFUser currentUser]){
        [self performSegueWithIdentifier:@"loggedInUser" sender:self];
    }else{
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (IBAction)signup:(id)sender {
     //[self performSegueWithIdentifier:@"requestSignup" sender:self];
    
    
    NSLog(@"HERE");
    [UIView animateWithDuration:1.5
                          delay:20.0
                        options:UIViewAnimationOptionCurveLinear // See other options
                     animations:^{
                        [self performSegueWithIdentifier:@"requestSignup" sender:self];
                     }
                     completion:^(BOOL finished) {
                         // Completion Block
                         
                     }];
    
}
@end
