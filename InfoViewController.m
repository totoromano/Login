//
//  InfoViewController.m
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "InfoViewController.h"
#import <Parse/Parse.h>

@interface InfoViewController (){
    BOOL needsResetFrame;
}

@end

@implementation InfoViewController

-(void)viewDidAppear:(BOOL)animated{
   // NSLog(@"ViewDidAppear");
    self.AboutContainer.layer.cornerRadius = 6.0f;
    self.view.backgroundColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:1.00];
        
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
            
            if(needsResetFrame){
            
                self.crAvatar.frame = CGRectMake(self.crAvatar.frame.origin.x-15, self.crAvatar.frame.origin.y, self.crAvatar.frame.size.width, self.crAvatar.frame.size.height);
                self.crAvatarFrame.frame = CGRectMake(self.crAvatarFrame.frame.origin.x-15, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
                
                
                self.rdAvatar.frame = CGRectMake(self.rdAvatar.frame.origin.x+15, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
                self.rdAvatarFrame.frame = CGRectMake(self.rdAvatarFrame.frame.origin.x+15, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
                
                self.crTitle.frame = CGRectMake(self.crTitle.frame.origin.x-15, self.crTitle.frame.origin.y, self.crTitle.frame.size.width, self.crTitle.frame.size.height);
                self.rdTitle.frame = CGRectMake(self.rdTitle.frame.origin.x+15, self.rdTitle.frame.origin.y, self.rdTitle.frame.size.width, self.rdTitle.frame.size.height);
                
                self.crSocial.frame = CGRectMake(self.crSocial.frame.origin.x-15, self.crSocial.frame.origin.y, self.crSocial.frame.size.width, self.crSocial.frame.size.height);
                self.rdSocial.frame = CGRectMake(self.rdSocial.frame.origin.x+15, self.rdSocial.frame.origin.y, self.rdSocial.frame.size.width, self.rdSocial.frame.size.height);
                //needsResetFrame = NO;
            }
            break;
            
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            self.ScrollContainer.contentSize = CGSizeMake(window.frame.size.height,window.frame.size.width + 100);
            
            self.crAvatar.frame = CGRectMake(self.crAvatar.frame.origin.x+15, self.crAvatar.frame.origin.y, self.crAvatar.frame.size.width, self.crAvatar.frame.size.height);
            self.crAvatarFrame.frame = CGRectMake(self.crAvatarFrame.frame.origin.x+15, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
            
            
            self.rdAvatar.frame = CGRectMake(self.rdAvatar.frame.origin.x-15, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
            self.rdAvatarFrame.frame = CGRectMake(self.rdAvatarFrame.frame.origin.x-15, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
            
            
            self.crTitle.frame = CGRectMake(self.crTitle.frame.origin.x+15, self.crTitle.frame.origin.y, self.crTitle.frame.size.width, self.crTitle.frame.size.height);
            self.rdTitle.frame = CGRectMake(self.rdTitle.frame.origin.x-15, self.rdTitle.frame.origin.y, self.rdTitle.frame.size.width, self.rdTitle.frame.size.height);
            
            self.crSocial.frame = CGRectMake(self.crSocial.frame.origin.x+15, self.crSocial.frame.origin.y, self.crSocial.frame.size.width, self.crSocial.frame.size.height);
            self.rdSocial.frame = CGRectMake(self.rdSocial.frame.origin.x-15, self.rdSocial.frame.origin.y, self.rdSocial.frame.size.width, self.rdSocial.frame.size.height);
            
            needsResetFrame = YES;
            
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
