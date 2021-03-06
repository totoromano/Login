//
//  TesListViewController.h
//  Login
//
//  Created by Dev on 10/27/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TesListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *searchBox;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *noResults;
-(void)setup;
-(void) orientationChanged:(NSNotification *)note;
@property (strong, nonatomic) IBOutlet UIView *headerView;


@end
