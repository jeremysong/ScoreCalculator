//
//  PlayerViewController.h
//  Score Calculator
//
//  Created by Song Jeremy on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerViewController : UIViewController

@property(nonatomic, strong) Player *selectedPlayer;
@property(nonatomic, strong) UILabel *equation;
@property(nonatomic, strong) UILabel *result;

-(void)arithmetic:(id)sender;

@end
