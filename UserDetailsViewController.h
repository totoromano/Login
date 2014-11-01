//
//  UserDetailsViewController.h
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface UserDetailsViewController : UIViewController < UICollectionViewDelegate,UICollectionViewDataSource>
/*
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *followsLabel;
 */
@property (strong, nonatomic) IBOutlet UILabel *emptyLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *schoolsCollection;
- (IBAction)logOut:(id)sender;
-(void)setUpAndReloadData;
@end
