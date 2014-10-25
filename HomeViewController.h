//
//  HomeViewController.h
//  Login
//
//  Created by Dev on 10/24/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
- (IBAction)login:(UIButton *)sender;
- (IBAction)signup:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *getStartedButton;
@property (retain
           , nonatomic) IBOutlet UIButton *logInButton;

@end
