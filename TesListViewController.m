//
//  TesListViewController.m
//  Login
//
//  Created by Dev on 10/27/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "TesListViewController.h"
#import "SchoolTableViewCell.h"

@interface TesListViewController (){
    NSArray *schools;
    NSArray *filteredSchools;
    NSArray *follows;
    
}

@end

@implementation TesListViewController

-(void)viewWillAppear:(BOOL)animated{
    follows = [PFUser currentUser][@"follows"];
    PFQuery *querySchools =  [PFQuery queryWithClassName:@"Schools"];
    [querySchools orderByAscending:@"Name"];
    schools = [NSMutableArray arrayWithArray:[querySchools findObjects]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:44/255.0 green:51/255.0 blue:52/255.0 alpha:0.95]];
    self.searchBox.textColor = [UIColor whiteColor];
    self.searchBox.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Search ..." attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.searchBox setDelegate:self];
    [self.searchBox addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRecog)];
    [self.view addGestureRecognizer:tap];
}
-(void)tapRecog{
    [self.searchBox resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SchoolTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolCell" forIndexPath:indexPath];
    
    if(self.searchBox.text.length > 0 ){
        if([follows containsObject:[filteredSchools objectAtIndex:indexPath.row][@"Name"]]){
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
        
        cell.name.text = [filteredSchools objectAtIndex:indexPath.row][@"Name"];
    }else{
        
        if([follows containsObject:[schools objectAtIndex:indexPath.row][@"Name"]]){
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
    }
    cell.followButton.tag = indexPath.row;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.searchBox.text.length > 0){
        return filteredSchools.count;
    }else
        return schools.count;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

-(void)textChanged:(UITextField *)textfield{
    NSLog(@"Changing");
    follows = [PFUser currentUser][@"follows"];
    filteredSchools = [schools filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Name contains[c] %@", self.searchBox.text]];
    [self.tableView reloadData];
    
    
}



@end
