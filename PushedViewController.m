//
//  PushedViewController.m
//  Login
//
//  Created by Dev on 10/23/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "PushedViewController.h"
#import <Parse/Parse.h>

@interface PushedViewController (){
    NSArray *links;
    NSArray *sports;
    NSMutableDictionary *existingSports;
    PFObject *school;
    NSMutableArray *sportsFound;
}

@end

@implementation PushedViewController

-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
    self.title = [_container objectAtIndex:0];
    school = [_container objectAtIndex:1];
    
   // NSLog(@"%s",[[[_container objectAtIndex:1] description]UTF8String]);
    
    PFQuery *query = [PFQuery queryWithClassName:@"Sports"];
    sports = [query findObjects];
    
    // NSLog(@"%s",[[sports description]UTF8String]);
    
    existingSports = [[NSMutableDictionary alloc]init];
    sportsFound = [[NSMutableArray alloc]init];
    
   // NSLog(@"%s",[[[school objectForKey:[sports objectAtIndex:0][@"Name"]] description]UTF8String]);
    for(int i = 0; i < sports.count; i++){
       // NSString *link = [school objectForKey:[sports objectAtIndex:i][@"Name"]];
        
//        if(![link isEqual: nil]){
//            [existingSports addEntriesFromDictionary:[NSDictionary dictionaryWithObject:link forKey:sports[i]]];
//        }
        NSString *currentSport =[sports objectAtIndex:i ] [@"Name"];
        
        if([school objectForKey:currentSport]){
            [sportsFound addObject:currentSport];
          //  NSLog(@"%s and %s",[currentSport UTF8String], [[school objectForKey:currentSport] UTF8String]);
            [existingSports addEntriesFromDictionary:[NSDictionary dictionaryWithObject:[school objectForKey:currentSport] forKey:currentSport]];
        }
        
    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = [_container objectAtIndex:0];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationItem setHidesBackButton:YES animated:NO];// = nil;
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   // NSLog(@"%s",[[existingSports description]UTF8String]);
   // NSLog(@"%s",[[sportsFound description]UTF8String]);
    
    return existingSports.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    cell.textLabel.text = [existingSports  objectForKey:[sportsFound objectAtIndex:indexPath.row]];
    
    //NSLog(@"%s",[[existingSports  objectForKey:[sportsFound objectAtIndex:indexPath.row]] UTF8String]);
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)manualBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
