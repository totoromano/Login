//
//  MainTabBarController.m
//  Login
//
//  Created by Dev on 10/25/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

-(void)viewWillAppear:(BOOL)animated{
   /*
    //tab1
    UIImage *selectedImage = [UIImage imageNamed:@"home-tab-selected"];
    UIImage *unselectedImage = [UIImage imageNamed:@"home2-tab"];
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:0];
    [item1 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
    
    //tab2
    selectedImage = [UIImage imageNamed:@"customers-tab-selected"];
    unselectedImage = [UIImage imageNamed:@"customers-tab"];
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:1];
    [item2 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
    
    //tab3
    selectedImage = [UIImage imageNamed:@"maps-tab-selected"];
    unselectedImage = [UIImage imageNamed:@"maps-tab"];
    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:2];
    [item3 setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
*/
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = [UIColor colorWithRed:63/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
