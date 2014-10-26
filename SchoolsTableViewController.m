//
//  SchoolsTableViewController.m
//  Login
//
//  Created by Dev on 10/18/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "SchoolsTableViewController.h"
#import "SchoolTableViewCell.h"
#import <Parse/Parse.h>

@interface SchoolsTableViewController (){
    NSMutableArray *schools;
    NSArray *userFollows;
}
@end

@implementation SchoolsTableViewController

-(void)viewWillAppear:(BOOL)animated{
    PFQuery *querySchools =  [PFQuery queryWithClassName:@"Schools"];
    [querySchools orderByAscending:@"Name"];
    schools = [NSMutableArray arrayWithArray:[querySchools findObjects]];
    
    userFollows = [PFUser currentUser][@"follows"];
    printf("reloading table \n");
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:1];
   // self.navigationBar.barTintColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:18],NSFontAttributeName,nil];

    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:0.95];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return schools.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SchoolTableViewCell *cell = (SchoolTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.name.textColor != [UIColor redColor]){
       cell.name.textColor = [UIColor redColor];
        NSLog(@"Selected: %s\n", [[tableView cellForRowAtIndexPath:indexPath].textLabel.text UTF8String]   );
        // PFObject *selection = [schools objectAtIndex:indexPath.row];
        [[PFUser currentUser]addUniqueObject:cell.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }else{
        cell.name.textColor = [UIColor blackColor];
        [[PFUser currentUser] removeObject :cell.name.text forKey:@"follows"];
        [[PFUser currentUser]save];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    if([userFollows containsObject:[schools objectAtIndex:indexPath.row][@"Name"]]){
        //cell.name.textColor = [UIColor redColor];
        cell.tag = 1;
        [cell.followButton setTitle:@"Scouting" forState:UIControlStateNormal];
        [cell.followButton setBackgroundImage:[UIImage imageNamed:@"following_bttn.png"] forState:UIControlStateNormal];
    }else{
       // cell.name.textColor = [UIColor whiteColor];
        cell.tag = 0;
        [cell.followButton setTitle:@"Prospect" forState:UIControlStateNormal];
        [cell.followButton setBackgroundImage:[UIImage imageNamed:@"follow_bttn.png"] forState:UIControlStateNormal];
    }
    
    cell.name.text = [schools objectAtIndex:indexPath.row][@"Name"];
    //cell.logo.image = [UIImage imageNamed:@"lipscomb-logo.png"];
    cell.followButton.tag = indexPath.row;
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
