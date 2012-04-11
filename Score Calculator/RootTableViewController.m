//
//  RootTableViewController.m
//  Score Calculator
//
//  Created by Song Jeremy on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootTableViewController.h"
#import "AppDelegate.h"
#import "CoreDataCommunicator.h"
#import "CustomCell.h"
#import "Player.h"
#import <QuartzCore/CALayer.h>

@interface RootTableViewController ()

@end

@implementation RootTableViewController

@synthesize managedObjectContext;
@synthesize playerArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setTitle:@"Score Board"];
    
    // Navigation Bar
    UIBarButtonItem *addNewPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPlayer)];
    self.navigationItem.rightBarButtonItem = addNewPlayerButton;
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    [self.navigationController.navigationBar.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.navigationController.navigationBar.layer setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [self.navigationController.navigationBar.layer setShadowRadius:3.0f];
    [self.navigationController.navigationBar.layer setShadowOpacity:1.0f];
    
    
    
    // TableView
    [self.tableView setRowHeight:96];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableViewBackground.png"]]];
    [self.tableView setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    [self.tableView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.tableView.layer setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [self.tableView.layer setShadowRadius:3.0f];
    [self.tableView.layer setShadowOpacity:1.0f];
    
    // CoreData
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    managedObjectContext = [appdelegate managedObjectContext];
    [playerArray removeAllObjects];
    playerArray = [CoreDataCommunicator searchObjectsForEntity:@"Player" withPredicate:nil andSortKey:@"seq" andSortAscending:NO andContext:managedObjectContext];
    
//    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [playerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlayerCell";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Player *currentPlayer = [playerArray objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *scoreLabel = (UILabel *)[cell viewWithTag:2];
    
//    UIFont *nameFont = [UIFont fontWithName:@"AmericanTypewriter" size:22];
    
    [nameLabel setFont:[UIFont systemFontOfSize:24]];
    [scoreLabel setFont:[UIFont systemFontOfSize:24]];
    
    [nameLabel setTextColor:[UIColor colorWithRed:0.85 green:0.75 blue:0.45 alpha:1]];
    [scoreLabel setTextColor:[UIColor colorWithRed:0.85 green:0.75 blue:0.45 alpha:1]];
    
    [nameLabel setText:[currentPlayer name]];
    [scoreLabel setText:[[currentPlayer score] stringValue]];
    
    [nameLabel setShadowColor:[UIColor blackColor]];
    [scoreLabel setShadowColor:[UIColor blackColor]];
    
    [nameLabel setShadowOffset:CGSizeMake(0.8, 1.8)];
    [scoreLabel setShadowOffset:CGSizeMake(0.8, 1.8)];
    
    [cell.contentView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [cell.contentView.layer setShadowOffset:CGSizeMake(2.0f, 0.0f)];
    [cell.contentView.layer setShadowOpacity:3.0f];
    [cell.contentView.layer setShadowOpacity:1.0f];
    
//    [cell.contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableViewCellwood.png"]]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)addNewPlayer
{
    
}

@end
