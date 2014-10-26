//
//  SchoolTableViewCell.m
//  Login
//
//  Created by Dev on 10/26/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SchoolTableViewCell.h"
#import <Parse/Parse.h>

@implementation SchoolTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)follow:(UIButton *)sender {
    
    UITableView *parentTable = (UITableView *)self.superview.superview;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    //NSLog(@"Selected: %d and %s",sender.tag, [[parentTable description] UTF8String]);
    
    if(self.name.textColor != [UIColor redColor]){
        NSLog(@"cell %d that cell is selected", sender.tag);
        self.name.textColor = [UIColor redColor];
        [self.followButton setTitle:@"Unfollow" forState:UIControlStateNormal];
        [[PFUser currentUser]addUniqueObject:self.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }else{
        NSLog(@"cell %d that cell is NOT  selected",sender.tag);
        self.name.textColor = [UIColor whiteColor];
        [self.followButton setTitle:@"Follow" forState:UIControlStateNormal];
        [[PFUser currentUser] removeObject :self.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }


}
@end
