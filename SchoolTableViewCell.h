//
//  SchoolTableViewCell.h
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIButton *followButton;
- (IBAction)follow:(UIButton *)sender;
@end
