//
//  UserDetailsViewController.h
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface UserDetailsViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *sportsCollection;

- (IBAction)logOut:(id)sender;
@end
