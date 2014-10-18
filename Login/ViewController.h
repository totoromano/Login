//
//  ViewController.h
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)forgotPassword:(id)sender;
- (IBAction)logIn:(id)sender;
- (IBAction)signUp:(id)sender;

-(void)tapRecog;

@end

