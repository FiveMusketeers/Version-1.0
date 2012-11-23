//
//  AppDelegate.m
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "ListItem.h"

@implementation AppDelegate{
}

// Both NSMutableArray

@synthesize items, lists;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Setup Picture Database for use
    // Setup some globals
	databaseName = @"PictureDatabase.sql";
    
    items = [[NSMutableArray alloc] init];
    lists = [[NSMutableArray alloc] init];
    
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    
	// Execute the "checkAndCreateDatabase" function
    
	[self checkAndCreateDatabase];
    
	// Query the database for all pictures and lists.
    
    NSLog(@"Now we're loading lists.");
    
    [self readListsFromDatabase];
    NSMutableDictionary *listDictionary = [[NSMutableDictionary alloc] init];
    
    // Creates the items that belong to each list.
    for ( NSString *s in self.lists )
    {
        NSMutableArray *array = [self readItemsFromDatabase: s];
        //NSLog(@"Expected table name: %@", s);
        for ( ListItem *thing in array )
        {
            NSLog(@"Item Name: %@ Image Path: %@", thing.name, thing.imagePath);
        }
        if ( array != nil )
        {
            [ listDictionary setObject:array forKey:s ];
        }
        else
        {
            NSLog(@"You suck.");
        }
    }
    
    // Loads all items.
	self.items = [self readItemsFromDatabase: @"items"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil];
        self.window.rootViewController = viewController1;
        [self.window makeKeyAndVisible];
        return YES;
    }
    else
    {
        return NO;
    }

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) checkAndCreateDatabase
{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
    
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
    
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];
    
	// If the database already exists then return without doing anything
	if(success) {
        NSLog(@"Database Found. at %@,", databasePath);
        return;
    }

    NSLog(@"Grabbing database from App");
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    
}

// This will pass an array of names.
// These names are the names of tables in the SQLite database.
-(void)readListsFromDatabase
{    
	// Setup the database object
    // NSLog(@"ReadItemsFromDatabase called. Path: %@", databasePath);
	sqlite3 *database;
    
	// Open the database from the users filessytem
    //NSLog(@"%d", sqlite3_open([databasePath UTF8String], &database));
	if( sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK )
    {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from lists";
        
		sqlite3_stmt *compiledStatement;
        
        // Result of database query
        int result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        
        // Error checking and variable dumps
        if( result != SQLITE_OK)
        {
            NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
        }
        
		if( result == SQLITE_OK )
        {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
				NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                
				// Add the list name to lists
				[lists addObject:aName];
                
			}
		}
        
        
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        
	}
	sqlite3_close(database);
}

-(void)readItemsFromTable
{
 // Based on the table names out of lists, we will readItemsFromDatabase to generate the final populated lists.
}

-(NSMutableArray *) readItemsFromDatabase: (NSString *)tableName
{
    //Set up temporary array to return
    NSMutableArray *tempReturnArray = [[NSMutableArray alloc] init];
    BOOL success = false;
	// Setup the database object
   // NSLog(@"ReadItemsFromDatabase called. Path: %@", databasePath);
	sqlite3 *database;
    
	// Open the database from the users filessytem
    //NSLog(@"%d", sqlite3_open([databasePath UTF8String], &database));
	if( sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK )
    {
		// Setup the SQL Statement and compile it for faster access
        //const char *sqlStatement = [command cStringUsingEncoding:@"ASCIIEncoding"];
        
        NSString *sqlString = @"select * from ";
        sqlString = [sqlString stringByAppendingString:tableName];
        const char *sqlStatement = [sqlString UTF8String];
        
		sqlite3_stmt *compiledStatement;
        
        // Result of database query
        NSLog(@"SQL Query being passed: %@", sqlString);
        int result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        
        // Error checking and variable dumps
        if( result != SQLITE_OK)
        {
            NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
        }
        
		if( result == SQLITE_OK )
        {
            NSLog(@"Reading from table: %@", tableName);
            
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
				NSString *aName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSString *aFile = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
               
                //Create an item object
                ListItem *item = [[ListItem alloc] initWithName:aName imagePath:aFile];
                // NSLog(@"Name: %@ ImagePath: %@", item.name, item.imagePath);
				// Add the item object to the animals Array
				[tempReturnArray addObject:item];
			}
            
            success = true;
            NSLog(@"Successful read.");
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        
	}
	sqlite3_close(database);
    if (success)
    {
        if ( tempReturnArray != nil )
        {
            return tempReturnArray;
        }
        else
        {
            NSLog(@"Nil array passed.");
            return Nil;
        }
        
    }
    else{
        return Nil;
    }

}

@end
