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

-(void)setup;
@end
