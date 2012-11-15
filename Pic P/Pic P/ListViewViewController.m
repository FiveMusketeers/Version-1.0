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

@interface ListViewViewController ()


@end

@implementation ListViewViewController
{
    NSMutableArray *tableData;
}

@synthesize tableData; // The array with the items.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
		// This will need to be an SQL query, or some other call where we generate our list of items.
		// Constructs an item.
		ListItem *objectOne = [[ListItem alloc] initWithName:@"scissors" imagePath:@"scissors.jpg"];
		ListItem *objectTwo = [[ListItem alloc] initWithName:@"brush" imagePath:@"brush.jpg"];
		ListItem *objectThree = [[ListItem alloc] initWithName:@"socks" imagePath:@"socks.jpg"];
		ListItem *objectFour = [[ListItem alloc] initWithName:@"hanger" imagePath:@"hanger.jpg"];
		ListItem *objectFive = [[ListItem alloc] initWithName:@"hat" imagePath:@"hat.jpg"];
		ListItem *objectSix = [[ListItem alloc] initWithName:@"earths" imagePath:@"earths.png"];
		// Creates an array of staticly called objects (for now)
		tableData = [[NSArray alloc] initWithObjects: objectOne, objectTwo, objectThree, objectFour, objectFive, objectSix, nil];
    }
    return self;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
	[self setListTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

// Determines how many rows the table view will contain. We can artificially inflate or limit this
// as we please.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// Pretty simple here.
	return [tableData count];
}

// Returns the data of a single row cell.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *identifier = @"ListCell";
	
	// Simply initialize the local variable.
	ListCell *cell = nil;
	
	// We've built and called our custom tableView cell.

	cell = (ListCell *)[ self.ListTable dequeueReusableCellWithIdentifier: identifier ];
	
	// We want to populate the cell with a listItem.
	
	ListItem *listItem = [ self.tableData objectAtIndex: indexPath.row ];
	
	if( cell == nil ) // It always is...unless there's some kind of caching going on.
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
		
		// End of plugging object attributes into the cellview.
	}
	
	return cell;
}
// End generating tableviewcell

@end
