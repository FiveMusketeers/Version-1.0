//
//  ListCreateViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

//Completely Modified to be Steven's Version

#import "ListCreateViewController.h"
#import "PictureAllViewController.h"
#import "ListItem.h"
#import "AppDelegate.h"


@implementation ListCreateViewController



///Components to create a list
@synthesize textField1, delegate, listPicture, listToAdd;

//Componenets to update lists array and dictionary
@synthesize lists, listDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Make a new list that we want to add
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [delegate.listToAdd removeAllObjects];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) goToViewPictures:(id)sender{
    PictureAllViewController *pavc = [[PictureAllViewController alloc]initWithNibName:@"PictureAllViewController" bundle:nil];
    
    pavc.isCreating = true;
    
    [self presentModalViewController:pavc animated:YES];
}

- (IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) save{
    
    
    BOOL alldone = TRUE;
    
    //Open the Database
    sqlite3 *database;
    
    //Information on list being added
    //Grabs list name and picture file name
    NSString *listName = textField1.text;
    NSString *listPictureFile = listPicture.getImageFile;
    if (listPictureFile == Nil){
        listPictureFile = @"list.png";
    }

    ListItem *theList = [ [ListItem alloc] initWithName:listName imagePath:listPictureFile ];
    
    //Adding the list to the lists table
    NSString *sqlCommand = [NSString stringWithFormat:@"INSERT INTO lists VALUES ('%@', '%@')", listName, listPictureFile];
    const char *sqlStatement = [sqlCommand UTF8String];
    sqlite3_stmt *compiledStatement;
    
    //Copy things from AppDelegate to update them
    self.databasePath = delegate.databasePath;
    self.listToAdd = delegate.listToAdd;
    self.lists = delegate.lists;
    self.listDictionary = delegate.listDictionary;
    
    NSLog(@"The path is: %@", self.databasePath);
    if( sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK )
    {
        
        //Generate SQL Command based on name and picture and execute
        int result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        NSLog(@"%s", sqlStatement);
        if (result == SQLITE_OK)
        {
            if (sqlite3_step(compiledStatement) == SQLITE_DONE){
                    NSLog(@"value inserted into lists");
                    
                    //Create table and execute
                    sqlCommand = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name VARCHAR(30), file VARCHAR(30))", listName];
                    
                    sqlStatement = [sqlCommand UTF8String];
                    
                    result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
                    
                    NSLog(@"%s", sqlStatement);
                    if (result == SQLITE_OK)
                    {
                        if (sqlite3_step(compiledStatement) == SQLITE_DONE){
                            NSLog(@"table Created");
                            
                            //Fill the table we just created
                            for (ListItem *insertItem in self.listToAdd){
                                sqlCommand = [NSString stringWithFormat:@"INSERT INTO '%@' VALUES ('%@','%@')", listName, insertItem.name, insertItem.imagePath];
                                sqlStatement = [sqlCommand UTF8String];
                                int result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
                                NSLog(@"%s", sqlStatement);
                                
                                if (result == SQLITE_OK)
                                {
                                    if (sqlite3_step(compiledStatement) == SQLITE_DONE){
                                        NSLog(@"value inserted into list");
                                    }
                                }
                                else
                                {
                                    NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
                                    alldone = FALSE;
                                }

                            }
                            
                            if (alldone){
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                                message:@"List Created"
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil];
                                [alert show];
                                [self.lists addObject:theList];
                                [self.listDictionary setObject:listToAdd forKey:listName];
                            }

                        }
                    }
                    else
                    {
                        NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
                    }
                    
        
            }
            else
            {
                NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
            }
        }
        sqlite3_finalize(compiledStatement);
        sqlite3_close(database);
    }
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
