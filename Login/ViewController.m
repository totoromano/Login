//
//  ViewController.m
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    if([PFUser currentUser]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    self.usernameField.text = @"";
    self.passwordField.text = @"";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usernameField becomeFirstResponder];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRecog)];
    [self.view addGestureRecognizer:tap];
    
    self.passwordField.delegate = self;
    
}
/*
 - (void)textFieldDidBeginEditing:(UITextField *)textField{
 //NSLog(@"here with %s\n",[[textField description]UTF8String]);
 if(textField.tag == 2 && textField.text.length > 3){
 self.logInButton.userInteractionEnabled = YES;
 }
 }
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgotPassword:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reset Password" message:@"Enter your email" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Submit",nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        NSString *email = [alertView textFieldAtIndex:0].text;
        [PFUser requestPasswordResetForEmailInBackground:email];
    }
}

- (IBAction)logIn:(id)sender {
    if(self.passwordField.text.length < 4 || self.usernameField.text.length < 3){
        [self failLogin];
    }else{
        [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                [self dismissViewControllerAnimated:NO completion:nil];
                                            } else {
                                                [self failLogin];
                                            }
                                        }];
    }
    
}

- (IBAction)signUp:(id)sender {
}

-(void)failLogin{
    CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    anim.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f) ], [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f) ] ] ;
    anim.autoreverses = YES ;
    anim.repeatCount = 2.0f ;
    anim.duration = 0.07f ;
    
    [ self.passwordField.layer addAnimation:anim forKey:nil ] ;
}
-(void)tapRecog{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}
@end
