//
//  CustomSegue.m
//  Login
//
//  Created by Dev on 10/24/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue


- (void)perform
{
    NSLog(@"Custom Segue Fired");
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
        [UIView transitionFromView:src.view
                        toView:dst.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                                completion:nil];/*^(BOOL finished){
                        NSLog(@"src: %s\n",[[src description]UTF8String]);
                        //[dst dismissViewControllerAnimated:NO completion:nil];
                        NSLog(@"Completed");
                    }];
    
     //   [UIView transitionFromView:src.view toView:dst.view duration:1.5 options:UIViewAnimationOptionTransitionCrossDissolve completion:NULL];
    
  */
    
}

@end
