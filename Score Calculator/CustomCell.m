//
//  CustomCell.m
//  Active Todo
//
//  Created by Song Jeremy on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()

@end

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect cellFrame = CGRectMake(0, 0, 320, 54);
        CGRect titleFrame = CGRectMake(20, 0, 170, 54);
        CGRect scoreFrame = CGRectMake(200, 0, 100, 54);
        
        [self setFrame:cellFrame];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:scoreFrame];
        
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [scoreLabel setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundColor:[UIColor clearColor]];
        
        [titleLabel setTextAlignment:UITextAlignmentLeft];
        [scoreLabel setTextAlignment:UITextAlignmentRight];
        
        [titleLabel setTag:1];
        [scoreLabel setTag:2];
        
        [self addSubview:titleLabel];
        [self addSubview:scoreLabel];
        
        [self.contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableCell.png"]]];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
