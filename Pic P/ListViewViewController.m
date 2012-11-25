//
//  ListViewViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListViewViewController.h"
#import "ListCell.h"
#import "ListItem.h"
#import "AppDelegate.h"

@interface ListViewViewController ()

@end

@implementation ListViewViewController
{
    NSMutableArray *tableData;
}
// The array with the items.
@synthesize tableData;
// The context of the controller. This affects what didSelect will do.
@synthesize displayLists;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        // Removed old, static call of ListItems into tableData
    }
    return self;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableData removeObjectAtIndex:indexPath.row];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Populate list for the scroll view. We grab the values from the delegate.
    // If we are in the list item view context, we want to load all the items given a list name.
    if ( self.displayLists )
    {
        // DISPLAY LIST CONTEXT
        NSLog(@"Context: Displaying all lists.");
        
        AppDelegate *delegate = ( AppDelegate * )[ [ UIApplication sharedApplication ] delegate ];
        self.tableData = delegate.lists;
        // END DISPLAY LIST CONTEXT
    }
    else
    {
        // DISPLAY LIST ITEMS CONTEXT
        NSLog(@"Context: Display all items from a list.");
        // Here we only want to display all the items from a single list.
        // we dont want to load table data here. ListCell will now load it before calling presentModelViewController.
        // In other words, we want another class to pass the data before this view is loaded.
        if( tableData != nil )
        {
            for ( ListItem *item in self.tableData )
            {
                NSLog( @"List Item FilePath: %@", item.imagePath );
            }
        }
        else
        {
            NSLog(@"self.tableData is empty. Cannot load.");
        }
        // END DISPLAY LIST ITEMS CONTEXT
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
// Switch to listview.
- (IBAction)listView
{
    ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"SecondViewController_iPhone" bundle:nil];
    [self presentModalViewController:listView animated:YES];
}

- (IBAction)PreviousMenu:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
// Determines how many rows the table view will contain.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// Pretty simple here.
	return [tableData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

// This gets called whenever a row is selected.
// There appears to be some kind of a delegate / UI issue, as this is not getting called.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell Selected");
    
    // Add all voice commands here.
}

// Generates the data of a single row cell.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *identifier = @"ListCell";
	
	// Simply initialize the local variable.
	ListCell *cell = nil;
	// We've built and called our custom tableView cell.
	cell = (ListCell *)[ self.ListTable dequeueReusableCellWithIdentifier: identifier ];
	// We want to populate the cell with a listItem.
	ListItem *listItem = [ self.tableData objectAtIndex: indexPath.row ];
	
	if( cell == nil )
	{
		// Load all of.....these things.
		NSArray *objects = [ [ NSBundle mainBundle ] loadNibNamed: @"ListCell_iPhone" owner:nil options:nil ];
		
		// Iterate through each object.
		for ( id currentObject in objects )
		{
			if ( [ currentObject isKindOfClass:[ ListCell class ] ] ) // If the object is suitable...
			{
				cell = (ListCell *)currentObject; // Cast it as a ListCell.
				break;
			}
		}
		// Assign all the object attributes to the cell attributes here.
		cell.nameLabel.text = listItem.name; // The cell takes on the name of the object.
		cell.image.image = listItem.getImage; // Cell's image grabs the listItem's image.
        
        // This grabs the context of the controller.
        cell.controllerContext = self.displayLists;
		
		// End of plugging object attributes into the cellview.
	}
    
	return cell;
}
// End generating tableviewcell

@end