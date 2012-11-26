//
//  CreatePictureViewController.m
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "CreatePictureViewController.h"
#import "AppDelegate.h"
#import "ListItem.h"

@interface CreatePictureViewController ()

@end

@implementation CreatePictureViewController
@synthesize pickenImage;

@synthesize textField1;
@synthesize imgPicker;
// List Item Properties that need to be filled out
@synthesize imageText;
@synthesize imagePath;

@synthesize databasePath;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    /*self.imgPicker=[[UIImagePickerController alloc]init];
    self.imgPicker.allowsImageEditing=YES;
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    */
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *textOfImage=[defaults objectForKey:@"textOfImage"];
    
    NSData *imageData=[defaults dataForKey:@"image"];
    
    UIImage *theImage=[UIImage imageWithData:imageData];
    
    imageText.text=textOfImage;
    
    pickenImage.image=theImage;
    
    
    
    /*NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"image.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
		const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &imageDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS IMAGE)";
            
            if (sqlite3_exec(imageDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                loaded.text = @"Failed to create table";
            }
            
            sqlite3_close(imageDB);
            
        } else {
            loaded.text = @"Failed to open/create database";
        }
    }
   */
    //[filemgr release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    button = nil;
    [self setPickenImage:nil];
    [self setImageText:nil];
    [self setTextField1:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }

    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)pickenImage:(id)sender {
    
    
    [self dismissModalViewControllerAnimated:YES];

}

- (IBAction)grabSavedImage:(id)sender
{
    self.imgPicker=[[UIImagePickerController alloc]init];
    imgPicker.delegate=self;
    self.imgPicker.allowsImageEditing=YES;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:self.imgPicker animated:YES];
}

- (IBAction)save:(id)sender {
 
    [imageText resignFirstResponder];
    
    NSLog(@"imageText %@", [imageText text]);
    
    NSString *textOfImage = [imageText text];
    
//    UIImage *theImage=pickenImage.image; // UI image from the iPhone gallery.
    
    NSString *filePath = self.imagePath; // Whatever image the user picked, this is the assets/filepath.
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    ListItem *object = [[ListItem alloc] initWithName:textOfImage imagePath:self.imagePath];
    NSLog(@"Item Name : %@ Item Path : %@", textOfImage, self.imagePath);
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSMutableArray *array = delegate.items;
    //NSLog(@"1");
    [array addObject: object];
    //NSLog(@"2");
    //NSData *imageData=UIImageJPEGRepresentation(theImage, 150);
    
    // Grab the imageList from the delegate.
    //[delegate.items setObject:object.imagePath forKey:textOfImage];
    
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults setObject:delegate.imageList forKey:@"imageList"];

    NSLog(@"data saved");
    NSLog(@"%@",textOfImage);
    NSLog(@"%@",filePath);
    
    for (ListItem *item in delegate.items) {
        NSLog(@"%@",item.imagePath);
    }
    

    //Define Database
    sqlite3 *database;
    
    //Create command and statement for SQL
    NSString *sqlCommand = [NSString stringWithFormat:@"INSERT INTO items VALUES ('%@', '%@')", textOfImage, self.imagePath];
    const char *sqlStatement = [sqlCommand UTF8String];
    sqlite3_stmt *compiledStatement;
    
    //Copy Database path from delegate
    self.databasePath = delegate.databasePath;
    
    //Open Connection
    if( sqlite3_open([delegate.databasePath UTF8String], &database) == SQLITE_OK )
    {
        
        //Prepare Statement for execution
        int result = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        NSLog(@"%s", sqlStatement);
        if (result == SQLITE_OK)
        {
			//Execute Step
            if (sqlite3_step(compiledStatement) == SQLITE_DONE){
                NSLog(@"value inserted into items");
			}
		}
        
		//Check for error
		else
        {
            NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
        }
        sqlite3_finalize(compiledStatement);
        sqlite3_close(database);
    }
    
    
    //[self saveImage:theImage :textOfImage];
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissModalViewControllerAnimated:YES];
    
    pickenImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSURL *url = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    
    self.imagePath = [url absoluteString];
    
   
    /*UIImage *takenImage=[info objectForKey:UIImagePickerControllerEditedImage];
    [self dismissModalViewControllerAnimated:YES];
     */
}
-(void)imagePickerControllerDidCancel:
(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)textFieldReturn:(id)sender
{
	//Possible to assign textField1.text to some NSString here
    [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)camera:(id)sender {
    imgPicker=[[UIImagePickerController alloc] init];
    imgPicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    imgPicker.delegate=self;
    //[self view bringSubviewToFront:imgPicker.view];
    [self presentModalViewController:imgPicker animated:YES];
    //
}

/*- (IBAction)findImage:(id)sender {
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &imageDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT address, phone FROM contacts WHERE name=\"%@\"", imageText.text];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(imageDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                //NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                //address.text = addressField;
                
               // NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                //phone.text = phoneField;
                
                loaded.text = @"Match found";
                
                //[addressField release];
                //[phoneField release];
            } else {
                loaded.text = @"Match not found";
                //address.text = @"";
                //phone.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(imageDB);
    }
}
*/
@end
