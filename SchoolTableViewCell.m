//
//  SchoolTableViewCell.m
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SchoolTableViewCell.h"
#import <Parse/Parse.h>

@implementation SchoolTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    
    UIDevice * device = [UIDevice currentDevice];
    if(device.orientation == UIDeviceOrientationLandscapeRight || device.orientation == UIDeviceOrientationLandscapeLeft ){
        
        [self orientationChanged:[NSNotification notificationWithName:@"-" object:device]];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) orientationChanged:(NSNotification *)note
{
    
   // NSLog(@"Orientation Changed! from cell");
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            self.followButton.frame = CGRectMake(226, 26, 86, 30);
            self.name.frame = CGRectMake(77, 12, 129, 53);
            break;
        case UIDeviceOrientationLandscapeRight:
        case UIDeviceOrientationLandscapeLeft:
            self.followButton.frame = CGRectMake(400, 26, 86, 30);
            self.name.frame = CGRectMake(77, 12, 200, 53);
            break;
        default:
            break;
    };
}


- (IBAction)follow:(UIButton *)sender {
    
       // NSLog(@"Pressed and tag = %d", sender.tag);
    
    //NSLog(@"Selected: %d and %s",sender.tag, [[parentTable description] UTF8String]);
    
    if(self.tag != 1){
        //NSLog(@"cell %d that cell is  NOT  selected", sender.tag);
        //self.name.textColor = [UIColor redColor];
        self.tag = 1;
        [self.followButton setTitle:@"Scouting" forState:UIControlStateNormal];
        [self.followButton setBackgroundImage:[UIImage imageNamed:@"following_bttn.png"] forState:UIControlStateNormal];
        
//        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
//        [currentInstallation addUniqueObject:self.name.text forKey:@"channels"];
//        [currentInstallation saveInBackground];
        
        [[PFUser currentUser]addUniqueObject:self.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }else if(self.tag == 1){
        //NSLog(@"cell %d that cell is selected",sender.tag);
        //self.name.textColor = [UIColor whiteColor];
        UIActionSheet *confirmation = [[UIActionSheet alloc]initWithTitle:self.name.text delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Stop Scouting" otherButtonTitles:nil];
        [confirmation showFromRect:CGRectMake(320, 480, 320, 50) inView:self.superview animated:YES];
        
    }


}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        self.tag = 0;
        [self.followButton setTitle:@"Prospect" forState:UIControlStateNormal];
        [self.followButton setBackgroundImage:[UIImage imageNamed:@"follow_bttn.png"] forState:UIControlStateNormal];
       
//        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
//        [currentInstallation removeObject:self.name.text forKey:@"channels" ];
//        [currentInstallation saveInBackground];
//        
        [[PFUser currentUser] removeObject :self.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }
}
@end
