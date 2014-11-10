//
//  InfoViewController.h
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
- (IBAction)logout:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UIView *AboutContainer;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollContainer;
@property (strong, nonatomic) IBOutlet UIButton *logOutButton;
@property (strong, nonatomic) IBOutlet UIImageView *crAvatar;
@property (strong, nonatomic) IBOutlet UIImageView *rdAvatar;
@property (strong, nonatomic) IBOutlet UIImageView *rdAvatarFrame;
@property (strong, nonatomic) IBOutlet UIImageView *crAvatarFrame;
@property (strong, nonatomic) IBOutlet UILabel *crTitle;
@property (strong, nonatomic) IBOutlet UILabel *crSocial;
@property (strong, nonatomic) IBOutlet UILabel *rdTitle;
@property (strong, nonatomic) IBOutlet UILabel *rdSocial;

-(void)setup;
@end
