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
#import "PlayerViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

@synthesize managedObjectContext;
@synthesize playerArray;
@synthesize nameField;

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
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    [self setTitle:@"Score Board"];
    
    // Navigation Bar
    UIBarButtonItem *addNewPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPlayer)];
    UIBarButtonItem *clearScore = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(clearAllScore)];
//    [clearScore setEnabled:false];
    self.navigationItem.rightBarButtonItem = addNewPlayerButton;
    self.navigationItem.leftBarButtonItem = clearScore;
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    [self.navigationController.navigationBar.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.navigationController.navigationBar.layer setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [self.navigationController.navigationBar.layer setShadowRadius:3.0f];
    [self.navigationController.navigationBar.layer setShadowOpacity:1.0f];
    
    
    
    // TableView
    [self.tableView setRowHeight:54];
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
    if ([playerArray count] == 0) {
        [clearScore setEnabled:false];
    } else {
        [clearScore setEnabled:true];
    }
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.managedObjectContext deleteObject:[playerArray objectAtIndex:indexPath.row]];
        [playerArray removeObject:[playerArray objectAtIndex:indexPath.row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
         NSError *saveError;
        [self.managedObjectContext save:&saveError];
        if ([playerArray count] == 0) {
            [self.navigationItem.leftBarButtonItem setEnabled:false];
        } else {
            [self.navigationItem.leftBarButtonItem setEnabled:true];
        }
    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}


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
    
    
    PlayerViewController *detailViewController = [[PlayerViewController alloc] initWithNibName:nil bundle:nil];
    [detailViewController setSelectedPlayer:[playerArray objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
     
}

#define newPlayerAlert 1
#define clearAllScoreAlert 2
-(void)addNewPlayer
{
    int index = 0;
    for (index = 0; index < [playerArray count]; index++) {
        [[playerArray objectAtIndex:index] setSeq:[NSNumber numberWithInt:index]];
    }
    
    UIAlertView *newPlayerNameDialog = [[UIAlertView alloc] initWithTitle:@"Add New Player Name" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 45, 245, 25)];
    [nameField setDelegate:self];
    [nameField setBackgroundColor:[UIColor whiteColor]];
    [nameField becomeFirstResponder];
    [nameField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [nameField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [nameField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [newPlayerNameDialog addSubview:nameField];
    [newPlayerNameDialog setTransform:CGAffineTransformMakeTranslation(0,10)];
    [newPlayerNameDialog setTag:newPlayerAlert];
    [newPlayerNameDialog show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == newPlayerAlert) {
        if (buttonIndex == 1) {
            //OK Button clicked
            Player *newPlayer = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:self.managedObjectContext];
            [newPlayer setName:[nameField text]];
            [newPlayer setScore:[[NSDecimalNumber alloc] initWithInt:0]];
            //Reorgnized all seq number
            if ([playerArray count] != 0) {
                if ([[[playerArray objectAtIndex:[playerArray count]-1] seq] intValue] != [playerArray count]-1) {
                    for (int index=0; index < [playerArray count]-1; index++) {
                        [[playerArray objectAtIndex:index] setSeq:[[NSNumber alloc] initWithInt:index]];
                    }
                }
                
            }
            [newPlayer setSeq:[[NSNumber alloc] initWithInt:[playerArray count]]];
            NSError *saveError;
            [self.managedObjectContext save:&saveError];
            
            [playerArray addObject:newPlayer];
            [self.navigationItem.leftBarButtonItem setEnabled:true];
            [self.tableView reloadData];
        }
    } else if (alertView.tag == clearAllScoreAlert) {
        if (buttonIndex == 1) {
            for (int index = 0; index < [playerArray count]-1; index++) {
                [[playerArray objectAtIndex:index] setScore:[[NSDecimalNumber alloc] initWithInt:0]];
            }
        }
        NSError * saveError;
        [self.managedObjectContext save:&saveError];
        
        [self.tableView reloadData];
    }
}

-(void)clearAllScore
{
    UIAlertView *clearAllScore = [[UIAlertView alloc] initWithTitle:@"Are you sure to clear all the scores?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [clearAllScore setTag:clearAllScoreAlert];
    [clearAllScore show];
}

@end
