//
//  UserDetailsViewController.m
//  Login
//
//  Created by Dev on 10/17/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "UserDetailsViewController.h"
#import "SchoolCollectionViewCell.h"
#import "PushedViewController.h"
#import <Parse/Parse.h>

@interface UserDetailsViewController (){
    NSArray *follows;

}

@end

@implementation UserDetailsViewController




-(void)viewDidAppear:(BOOL)animated{
    if(![PFUser currentUser]){
        [self performSegueWithIdentifier:@"requestLogin" sender:self];
    }
}
-(void)viewWillAppear:(BOOL)animated{
//    self.usernameLabel.text = [[PFUser currentUser] objectForKey:@"username"];
//    self.emailLabel.text = [[PFUser currentUser]objectForKey:@"email"];
//    self.idLabel.text = [[PFUser currentUser] objectId];
    
    follows = [PFUser currentUser][@"follows"];
    NSString *content = @"";
    
    for(int i =0; i < follows.count; i ++){
        content = [content stringByAppendingString:[NSString stringWithFormat:@"%@ \n",[follows objectAtIndex:i] ]];
    }
//    self.followsLabel.text = content;
    [self.schoolsCollection reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"The current user is: %s\n", [[[PFUser currentUser]description]UTF8String]);
    // Do any additional setup after loading the view.
    [self.schoolsCollection setDataSource:self];
    [self.schoolsCollection setDelegate:self];
    
    self.schoolsCollection.backgroundColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier]isEqualToString:@"schoolSelected"]){
        SchoolCollectionViewCell *senderCell = (SchoolCollectionViewCell *)sender;
        PushedViewController *pvc = [segue destinationViewController];
        pvc.container = @[ senderCell.schoolTitle.text];
    
    }
}


- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"requestLogin" sender:self];
    //[self.navigationController popToRootViewControllerAnimated:NO];
    
    NSLog(@"%s\n",[[UIApplication description]UTF8String]);
}


/*
    Collection View Methods
*/

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return follows.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SchoolCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SchoolCell" forIndexPath:indexPath];
    
    cell.schoolTitle.text = [follows objectAtIndex:indexPath.row];
    cell.schoolLogo.image = [UIImage imageNamed:@"lipscomb-logo.png"];
    
    return cell;

}

@end
