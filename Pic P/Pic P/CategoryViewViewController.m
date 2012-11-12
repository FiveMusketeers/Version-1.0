//
//  CategoryViewViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "CategoryViewViewController.h"
#import "Category.h"
#import "ListCell.h" // Change the name. Make it more flexible, OR make a new cell view.

@interface CategoryViewViewController ()


@end

@implementation CategoryViewViewController

@synthesize tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        // Custom initialization
		// This will need to be an SQL query, or some other call where we generate our list of items.
        
        
		// Constructs an item.
		Category *objectOne = [[Category alloc] initWithName:@"Musketeer 1" imagePath:@"icon.png"];
		Category *objectTwo = [[Category alloc] initWithName:@"Musketeer 2" imagePath:@"icon.png"];
		Category *objectThree = [[Category alloc] initWithName:@"Musketeer 3" imagePath:@"icon.png"];
		Category *objectFour = [[Category alloc] initWithName:@"Musketeer 4" imagePath:@"icon.png"];
		Category *objectFive = [[Category alloc] initWithName:@"Musketeer 5" imagePath:@"icon.png"];
		
		// Creates an array of staticly called objects (for now)
		tableData = [[NSArray alloc] initWithObjects: objectOne, objectTwo, objectThree, objectFour, objectFive, nil];
    }
    return self;
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
- (IBAction)PreviousMenu:(id)sender
{
    [ self dismissModalViewControllerAnimated:YES ];
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
	
	// PLug into the table view and tell it we're reusing the same view for each row.
	cell = (ListCell *)[ self.listTable dequeueReusableCellWithIdentifier: identifier ];
	
	// We want to populate the cell with a listItem.
	
	Category *categoryItem = [ self.tableData objectAtIndex: indexPath.row ];
	
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
		
		cell.nameLabel.text = categoryItem.categoryName; // The cell takes on the name of the object.
		cell.image.image = categoryItem.getImage; // Cell's image grabs the listItem's image.
		
		// End of plugging object attributes into the cellview.
	}
	
	return cell;
}
// End generating tableviewcell
@end
