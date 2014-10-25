//
//  SignUpViewController.m
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRecog)];
    [self.view addGestureRecognizer:tap];
    //[self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
   // self.view.layer.backgroundColor = [[UIColor clearColor]CGColor];
    
     [self.usernameField becomeFirstResponder];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUp:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self dismissViewControllerAnimated:NO completion:nil];
            //[self performSegueWithIdentifier:@"signedUp" sender:self];
            
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
           // self.errorLabel.text = errorString;
            NSLog(@"%s",[errorString UTF8String]);
            if([errorString hasPrefix:@"username"]){
                [self failSignup:@"username"];
            }else{
                [self failSignup:@"password"];
            }
        }
    }];
}

-(void)failSignup:(NSString *)error{
    CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    anim.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f) ], [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f) ] ] ;
    anim.autoreverses = YES ;
    anim.repeatCount = 2.0f ;
    anim.duration = 0.07f ;
    
    if([error isEqualToString:@"username"]){
        [ self.usernameField.layer addAnimation:anim forKey:nil ] ;
    }else{
        [ self.emailField.layer addAnimation:anim forKey:nil ] ;
    }
    
    
}

- (IBAction)cancel:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    //[self performSegueWithIdentifier:@"signUpBack" sender:self];
}
-(void)tapRecog{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.emailField resignFirstResponder];
}

- (IBAction)goBack:(UIButton *)sender {
    
    //[self performSegueWithIdentifier:@"signUpBack" sender:self];
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
