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
    self.AboutContainer.layer.cornerRadius = 6.0f;
    self.view.backgroundColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:0.95];
        
}
-(void)viewDidDisappear:(BOOL)animated{
   // NSLog(@"viewDidDisappear");
}

-(void)viewWillAppear:(BOOL)animated{
    // NSLog(@"viewWillAppear");
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

-(void) setup{
    if([PFUser currentUser])
    self.textLabel.text = [@"Hello, " stringByAppendingString:(NSString *)[[PFUser currentUser] username] ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    switch( device.orientation)
    {
        case UIDeviceOrientationPortrait:
            self.ScrollContainer.contentSize = CGSizeMake(0,0);
            break;
            
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            self.ScrollContainer.contentSize = CGSizeMake(window.frame.size.height,window.frame.size.width + 100);
            break;
            
        default:
            break;
    }

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
