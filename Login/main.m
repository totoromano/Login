//
//  main.m
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        int retval;
        @try{
            retval = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception --> %s", [[exception.userInfo description] UTF8String]);
           
            // NSString *codeString = exception.name;
            // [PFAnalytics trackEvent:@"error" dimensions:@{ @"code": codeString }];
            
            @throw;
        }
        return retval;
        
    }
}
