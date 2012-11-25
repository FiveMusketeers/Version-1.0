//
//  ListCell.m
//  Pic P
//
//  Created by Levon Powell on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListCell.h"
// We import the app delegate so we may import the listDictionary
#import "AppDelegate.h"

// This pushed the next ListViewViewController
#import "ListViewViewController.h"


@implementation ListCell


@synthesize nameLabel;
@synthesize image;
@synthesize fliteController;
@synthesize slt;

// This is the context of the view controller. I'm not sure how useful this will be here, but let's try it anyways.
@synthesize controllerContext;

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
    
    // Checking context
//    NSLog( controllerContext ? @"This should now display all the items associated with this list." : @"This is an item. The machine should dictate the label, and that's it." );
    
    NSString *say_string = nameLabel.text;
    
//    NSLog( @"Label: %@", say_string );
    
    [self.fliteController say:say_string withVoice:self.slt];
    
    // So, if the item is a list, then we re-load the controller, but only include entries from the list.
    if( controllerContext == false )
    {
        AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSDictionary *listDictionary = delegate.listDictionary;
        
        // Now we want to get the items specific to the list. We will search the dictionary with the key we have: the nameLabel.text.
        
        ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"ListViewViewController_iPhone" bundle:nil];
        
        // Pass the array with the list items to the controller.
        listView.tableData = [ listDictionary objectForKey:say_string ];

        // Now we have a controller packed with an array of list items, now we just need to render them.
        // Let's grab our delegate and get it to render the view!
        
    }
  
    
}

@end
