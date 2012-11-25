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

@synthesize textField1, delegate, listPicture, listToAdd;

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
    //    //Copy database path
    //    self.databasePath = delegate.databasePath;
    //
    //    NSLog(@"Path: %@", self.databasePath);
    //Verify that you want the list created
    
    //Open the Database
    sqlite3 *database;
    //Information on list being added
    //Grabs list name and picture file name
    NSString *listName = textField1.text;
    NSString *listPictureFile = listPicture.getImageFile;
    if (listPictureFile == Nil){
        listPictureFile = @"list.png";
    }
    else{
    }
    
    NSString *sqlCommand = [NSString stringWithFormat:@"INSERT INTO lists VALUES ('%@', '%@')", listName, listPictureFile];
    const char *sqlStatement = [sqlCommand UTF8String];
    sqlite3_stmt *compiledStatement;
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.databasePath = delegate.databasePath;
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
            }
        }
        else
        {
            NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
        }
        
        
        //Create table and execute
        sqlCommand = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name VARCHAR(30), file VARCHAR(30))", listName];
        
        sqlStatement = [sqlCommand UTF8String];
        
        result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        
        NSLog(@"%s", sqlStatement);
        if (result == SQLITE_OK)
        {
            if (sqlite3_step(compiledStatement) == SQLITE_DONE){
                NSLog(@"table Created");
            }
        }
        else
        {
            NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
        }
        
        //Grab listToAdd and generate command to insert array into the table
        delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.listToAdd = delegate.listToAdd;
        
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
