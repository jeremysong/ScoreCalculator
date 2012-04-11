//
//  Player.h
//  Score Calculator
//
//  Created by Song Jeremy on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDecimalNumber * score;
@property (nonatomic, retain) NSNumber * seq;

@end
