//
//  ListCell.m
//  Pic P
//
//  Created by Levon Powell on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

@synthesize nameLabel;
@synthesize image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
	{
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
