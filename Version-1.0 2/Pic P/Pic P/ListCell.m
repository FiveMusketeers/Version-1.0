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
@synthesize fliteController;
@synthesize slt;

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

- (FliteController *)fliteController {
	if (fliteController == nil) {
		fliteController = [[FliteController alloc] init];
	}
	return fliteController;
}

- (Slt *)slt {
	if (slt == nil) {
		slt = [[Slt alloc] init];
	}
	return slt;
}

// We need this to respond to two different contexts.
// We want this to say the list name, then display the list items
// Alternatively, we simply want this to say the item name if we are already in a list.
-(IBAction) Act_voice:(id)sender
{
    NSString *say_string = nameLabel.text;
    [self.fliteController say:say_string withVoice:self.slt];
    
    // After the object's name has been read out by the machine, we need to check the context here
    
}

@end
