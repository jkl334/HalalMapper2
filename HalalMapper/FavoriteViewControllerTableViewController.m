//
//  FavoriteViewControllerTableViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 5/2/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "FavoriteViewControllerTableViewController.h"

@interface FavoriteViewControllerTableViewController ()

@end

@implementation FavoriteViewControllerTableViewController

@synthesize favoriteData;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favoriteData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
 
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.favoriteData objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    NSObject_DatabaseHelper *database = [DatabaseLoader getDatabase];
    NSArray *cartDataToPush           = [database findByName:[self.favoriteData objectAtIndex:indexPath.row]];
    
    // Prepare dataViewController to push
    UIStoryboard       *storyboard         = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DataViewController *dataViewController = (DataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"dataViewController"];
    // Set current Cart in dataView
    [dataViewController setCurrentCart:cartDataToPush];
    [self.navigationController pushViewController:dataViewController animated:YES];
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
