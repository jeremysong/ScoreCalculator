//
//  RootTableViewController.h
//  Score Calculator
//
//  Created by Song Jeremy on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *playerArray;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) UITextField *nameField;

-(void)addNewPlayer;
-(void)clearAllScore;

@end
