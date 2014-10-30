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
    
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    // Add view to super view temporarily
    [sourceViewController.view.superview insertSubview:destinationViewController.view atIndex:0];
    
    [UIView animateWithDuration:0.28
                          delay:0.0
                        options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         [sourceViewController.view.layer setOpacity:0.01];

                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
                         [sourceViewController dismissViewControllerAnimated:NO completion:NULL]; // dismiss VC
                     }];
    
    
    
   /* UIViewController *src = (UIViewController *) self.sourceViewController;
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
    
  /*  [self transitionFromViewController:src
                      toViewController:dst
                              duration:0.25
                               options:UIViewAnimationOptionCurveEaseInOut
                            animations:^{
                                src.view.alpha = 0;
                                dst.view.alpha = 1;
                            } completion:^(BOOL finished) {
                                [src removeFromParentViewController];
                                [dst didMoveToParentViewController:self];
                            }];
   */
    
}

@end
