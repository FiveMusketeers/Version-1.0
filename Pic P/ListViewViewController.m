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
@synthesize tableName;
// The context of the controller. This affects what didSelect will do.
@synthesize displayLists;
// Text to speech variables
@synthesize fliteController;
@synthesize slt;
// End text to speech variables

//The Views Title
@synthesize title;
@synthesize listName;
@synthesize saveButton;

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
        //CHANGE TITLE LABEL
        title.text = @"Lists";
        
        // DISPLAY LIST CONTEXT
        //NSLog( @"Context: Displaying all lists." );
        
        AppDelegate *delegate = ( AppDelegate * )[ [ UIApplication sharedApplication ] delegate ];
        self.tableData = delegate.lists;
        // END DISPLAY LIST CONTEXT
    }
    else
    {
        //CHANGE TITLE LABEL
        [title setHidden:YES];
        [listName setHidden:NO];
        [saveButton setHidden:NO];
        listName.text = tableName;
        
        
        // DISPLAY LIST ITEMS CONTEXT
        NSLog( @"Context: Display all items from a list." );
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
            NSLog( @"self.tableData is empty." );
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

// This gets called whenever a row is selected.
// There appears to be some kind of a delegate / UI issue, as this is not getting called.

// This also calls the text to speech framework.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"Cell Selected");
    
    // Get the selected cell.
    ListCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath]; // Ignore the warning. It's giving us what we want.

    NSString *cellLabel = selectedCell.nameLabel.text;
    
//    NSLog( @"Label: %@", cellLabel );
    
    // Now we want to check the controller context.

    if( self.displayLists == TRUE ) // Again, this works, so ignore the warning.
    {
//        NSLog(@"Switching to a ListItem display.");
        
        AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSDictionary *listDictionary = delegate.listDictionary;
        
        //SHARE CONTEXT
        if ( self.shareLists )
		{
            //get the documents directory:
            NSArray *paths = NSSearchPathForDirectoriesInDomains
            (NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            
            
            //make a file name to write the data to using the documents directory:
            NSString *fileName = [NSString stringWithFormat:@"%@/%@.txt",
                                  documentsDirectory, cellLabel];
            
            NSMutableArray *listToShare = [listDictionary objectForKey:cellLabel];
            
            //create content
            NSString *content = [NSString stringWithFormat:@"%@ contents: \n", cellLabel];
			
            int item_counter = 1;
			
            for(ListItem *itemRead in listToShare)
			{
                content = [content stringByAppendingString: [NSString stringWithFormat:@"Item %d: %@ \n", item_counter, itemRead.name]];
                item_counter++;
            }
            
            //save content to the documents directory
            [content writeToFile:fileName
                      atomically:NO
                        encoding:NSStringEncodingConversionAllowLossy
                           error:nil];
			
			// We have to create an HTTP request.
			
			// Grab the file we just created and encode it.
			
			NSError *error = [[NSError alloc] init];

			// We should have the file represented as an encoded string.
			
			NSData *postData = [NSData dataWithContentsOfFile:fileName];
			
			NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
			[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://picsp.0fees.net/upload.php"]]];
			// POST is how we send the file
			[request setHTTPMethod:@"POST"];
			
			NSString *boundary = @"---------------------------14737809831466499882746641449";
			NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
			[request addValue:contentType forHTTPHeaderField: @"Content-Type"];

			// This creates the body of the HTTP Request
			// All of this is essential
			NSMutableData *body = [NSMutableData data];
			[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

			[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"%@.txt\"\r\n", cellLabel] dataUsingEncoding:NSUTF8StringEncoding]];
			[body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
			// This is the file put into a string
			[body appendData:postData];
			[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
			[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
			
			[request setHTTPBody:body];
			[request addValue:[NSString stringWithFormat:@"%d", [body length]] forHTTPHeaderField:@"Content-Length"];
			
			
			//NSLog(@"Data: %@",[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
			//NSLog(@"%@",request.allHTTPHeaderFields);
			
			// This code listens for a reponse from the site:
			
			// Initialize the response variable
			NSHTTPURLResponse* urlResponse = nil;
			
			// This sends the request and takes in any reponse from the server.
			NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
			
			NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
			//NSLog(@"Response Code: %d", [urlResponse statusCode]);
			 
			if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300)
			{
				NSLog(@"Response: %@", result);
			}
			
			// End of HTTP request code.
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"Sharing Complete"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

            //NSLog(@"It saved to: %@", documentsDirectory);
        }
        else{
            // Now we want to get the items specific to the list. We will search the dictionary with the key we have: the nameLabel.text.
            //VIEW LIST CONTEXT
            ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"ListViewViewController_iPhone" bundle:nil];

            
            // Pass the array with the list items to the controller.
            listView.tableData = [ listDictionary objectForKey:cellLabel ];
            listView.tableName = cellLabel;
            
            listView.displayLists = false;
            // Render the view.
            // This allows the back to return to the list view.
            [self presentModalViewController:listView animated:YES];
        }
        
        
    }
    else
    {
        //NSLog(@"ListItem selected.");
        [self.fliteController say:cellLabel withVoice:self.slt];
    }
}

// Generates the data of a single row cell.
- (ListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
		
		// End of plugging object attributes into the cellview.
	}
    
	return cell;
}
// End generating tableviewcell


// Text to speech framework
- (FliteController *)fliteController
{
	if (fliteController == nil)
    {
		fliteController = [[FliteController alloc] init];
	}
	return fliteController;
}

- (Slt *)slt
{
	if (slt == nil)
    {
		slt = [[Slt alloc] init];
	}
	return slt;
}
// End text to speech framework

- (IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)saveName:(id)sender{
    AppDelegate *delegate = ( AppDelegate * )[ [ UIApplication sharedApplication ] delegate ];
    NSString *newListName = listName.text;
    [delegate.listDictionary setObject:tableData forKey:newListName ];
    [delegate.listDictionary removeObjectForKey: tableName];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"List Saved"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [self dismissModalViewControllerAnimated:TRUE];
}



@end
