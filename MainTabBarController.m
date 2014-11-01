//
//  MainTabBarController.m
//  Login
//
//  Created by Dev on 10/25/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "MainTabBarController.h"
#import "UserDetailsViewController.h"
#import "TesListViewController.h"
#import "InfoViewController.h"
#import <Parse/Parse.h>

@interface MainTabBarController ()

@end

@implementation MainTabBarController
-(void)viewDidAppear:(BOOL)animated{
    [self setupItems];
    if(![PFUser currentUser]){
       // NSLog(@"Main Tab Bar Controller Working ");
        [self performSegueWithIdentifier:@"TestRequest" sender:self];
    }

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"MAin tab COntroller VIewWillAppear with VCS: %s", [[self.viewControllers description]UTF8String]);
    //UserDetailsViewController * userDetVc = [self.viewControllers objectAtIndex:1];
   // [userDetVc.schoolsCollection reloadData];
    
    InfoViewController *infoVC = [self.viewControllers objectAtIndex:2];
    [infoVC setup];
    
    TesListViewController *tlVC = [self.viewControllers objectAtIndex:0];
    [tlVC.tableView reloadData];
    
    [self setSelectedIndex:1];
    
    [self setupItems];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = [UIColor colorWithRed:63/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    [self setupItems];
    
    
}

-(void)setupItems{
    //tab1
    UIImage *selectedImage = [UIImage imageNamed:@"search_icon_selected.png"];
    UIImage *unselectedImage = [UIImage imageNamed:@"search_icon.png"];
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:0];
    [item1 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
    //[item1 initWithTitle:@"Title 1" image:unselectedImage selectedImage:selectedImage];
    [item1 setTitle:@"Search"];
    [item1 setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor redColor] }
                         forState:UIControlStateSelected];
    
    //tab2
    selectedImage = [UIImage imageNamed:@"home_selected.png"];
    unselectedImage = [UIImage imageNamed:@"home_icon.png"];
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:1];
    [item2 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
    //[item2 initWithTitle:@"Title 2" image:unselectedImage selectedImage:selectedImage];
    [item2 setTitle:@"Home"];
    [item2 setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor redColor] }
                         forState:UIControlStateSelected];
    
    //tab3
    selectedImage = [UIImage imageNamed:@"about_icon_selected.png"];
    unselectedImage = [UIImage imageNamed:@"about_icon.png"];
    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:2];
    [item3 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
    //[item3 initWithTitle:@"Title 3" image:unselectedImage selectedImage:selectedImage];
    [item3 setTitle:@"About"];
    [item3 setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor redColor] }
                         forState:UIControlStateSelected];
    
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
    //NSLog(@"Leaving here");
}


@end
