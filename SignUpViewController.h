//
//  SignUpViewController.h
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signUp:(id)sender;
- (IBAction)cancel:(id)sender;
- (void)tapRecog;

@end
