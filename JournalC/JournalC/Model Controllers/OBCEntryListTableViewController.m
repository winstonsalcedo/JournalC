//
//  OBCEntryListTableViewController.m
//  JournalC
//
//  Created by winston salcedo on 5/20/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

#import "OBCEntryListTableViewController.h"
#import "OBCEntryController.h"
#import "OBCEntryDetailViewController.h"
#import "OBCEntry.h"


@interface OBCEntryListTableViewController ()

@end

@implementation OBCEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[OBCEntryController shared] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDetailVC" forIndexPath:indexPath];
    OBCEntry * entry = [[[OBCEntryController shared] entries] indexOfObject:indexPath.row];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        OBCEntry *entry = [[[OBCEntryController shared] entries] indexOfObject:indexPath.row];
        [[OBCEntryController shared] removeEntry:entry];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        OBCEntryDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.entry = [[OBCEntryController shared] objectAtIndex:indexPath.row];
    }

}

@end
