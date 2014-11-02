//
//  PushedViewController.h
//  Login
//
//  Created by Dev on 10/23/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSArray *container;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)manualBack:(id)sender;

@end
