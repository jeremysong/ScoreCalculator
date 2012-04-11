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
{
    int nextSeq;
}

@property(nonatomic,strong) Player *selectedPlayer;

@end
