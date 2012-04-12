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
        CGRect cellFrame = CGRectMake(0, 0, 320, 96);
        CGRect titleFrame = CGRectMake(20, 5, 200, 90);
        CGRect scoreFrame = CGRectMake(230, 5, 70, 90);
        
        [self setFrame:cellFrame];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:scoreFrame];
        
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [scoreLabel setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundColor:[UIColor clearColor]];
        
        [titleLabel setTag:1];
        [scoreLabel setTag:2];
        
        [self addSubview:titleLabel];
        [self addSubview:scoreLabel];
        
        [self.contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableViewCell.png"]]];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
