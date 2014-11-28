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
    NSLog(@"ViewDidAppear");
    self.AboutContainer.layer.cornerRadius = 6.0f;
    self.view.backgroundColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:1.00];
    int alphaX = 15;
    if([[UIDevice currentDevice]orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice]orientation] == UIDeviceOrientationLandscapeRight){
        self.crAvatar.frame = CGRectMake(41, self.crAvatar.frame.origin.y, 118, self.crAvatar.frame.size.height);
        self.crAvatarFrame.frame = CGRectMake(7, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
        //NSLog(@"This piece x:%f",self.rdAvatar.frame.origin.x);
        self.rdAvatar.frame = CGRectMake(362, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
        self.rdAvatarFrame.frame = CGRectMake(329, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
         //NSLog(@"This piece x:%f",self.rdAvatar.frame.origin.x);
    }
    
}
-(void)viewDidDisappear:(BOOL)animated{
  // NSLog(@"viewDidDisappear");
}

-(void)viewWillAppear:(BOOL)animated{
   NSLog(@"viewWillAppear");
    int alphaX = 15;
   // [self orientationChanged:nil];
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self orientationChanged:nil];
    // Do any additional setup after loading the view.
   // NSLog(@"username: %s",[[[PFUser currentUser]username] UTF8String]);
    //self.textLabel.text = [[[PFUser currentUser] username] UTF8String] ;
   // NSLog(@"username: %s",[[[PFUser currentUser]username] UTF8String]);
    [self setup]; [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}
- (void) orientationChanged:(NSNotification *)note
{
    int alphaX = 15;
    switch ([[UIDevice currentDevice]orientation]) {
        case UIDeviceOrientationPortrait :
            
            needsResetFrame = NO;
            
            //NSLog(@"Portrait work here  , x%f", self.crAvatar.frame.origin.x);
            //41,151,63,64
           //22,133,100,100
            
            //159,133,100,100
            //177,151,63,64
               
            self.crAvatar.frame = CGRectMake(41, self.crAvatar.frame.origin.y, self.crAvatar.frame.size.width, self.crAvatar.frame.size.height);
            self.crAvatarFrame.frame = CGRectMake(22, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
            //NSLog(@"Re-Portrait work here  , x%f", self.crAvatar.frame.origin.x);
            
            self.rdAvatar.frame = CGRectMake(177, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
            self.rdAvatarFrame.frame = CGRectMake(159, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            
            NSLog(@"Now work here %d", [[UIDevice currentDevice]orientation]);
            NSLog(@"Now work here  x:%f", self.crAvatar.frame.origin.x);
            if(!needsResetFrame){
                self.crAvatar.frame = CGRectMake(26, self.crAvatar.frame.origin.y, self.crAvatar.frame.size.width, self.crAvatar.frame.size.height);
                self.crAvatarFrame.frame = CGRectMake(7, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
              
                
                self.rdAvatar.frame = CGRectMake(192, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
                self.rdAvatarFrame.frame = CGRectMake(174, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
                
                needsResetFrame = YES;
                
            NSLog(@"2.Doing work here  , w%f and frame h:%f", self.crAvatar.frame.size.width,self.crAvatarFrame.frame.size.height);
            }
            break;
        default:
            break;
    };
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
    int alphaX = 15;
    
    switch( device.orientation)
    {
        case UIDeviceOrientationPortrait:
            self.ScrollContainer.contentSize = CGSizeMake(0,0);
            
            self.crAvatar.frame = CGRectMake(41, self.crAvatar.frame.origin.y, self.crAvatar.frame.size.width, self.crAvatar.frame.size.height);
            self.crAvatarFrame.frame = CGRectMake(22, self.crAvatarFrame.frame.origin.y, self.crAvatarFrame.frame.size.width, self.crAvatarFrame.frame.size.height);
            //NSLog(@"Re-Portrait work here  , x%f", self.crAvatar.frame.origin.x);
            
            self.rdAvatar.frame = CGRectMake(177, self.rdAvatar.frame.origin.y, self.rdAvatar.frame.size.width, self.rdAvatar.frame.size.height);
            self.rdAvatarFrame.frame = CGRectMake(159, self.rdAvatarFrame.frame.origin.y, self.rdAvatarFrame.frame.size.width, self.rdAvatarFrame.frame.size.height);
            break;
            
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
//            NSLog(@"1.Doing work here  , x%f", self.crAvatar.frame.origin.x);
            self.ScrollContainer.contentSize = CGSizeMake(window.frame.size.height,window.frame.size.width + 100);
            
            [self.ScrollContainer scrollRectToVisible:CGRectMake(0,35, self.ScrollContainer.frame.size.width, self.ScrollContainer.frame.size.height) animated:NO];
            
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
