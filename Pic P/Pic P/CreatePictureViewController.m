//
//  CreatePictureViewController.m
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "CreatePictureViewController.h"

@interface CreatePictureViewController ()

@end

@implementation CreatePictureViewController
@synthesize pickenImage;
@synthesize imageText;
@synthesize textField1;
@synthesize imgPicker;

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
    
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //NSString *textOfImage=[defaults objectForKey:@"textOfImage"];
    //NSData *imageData=[defaults dataForKey:@"image"];
    //UIImage *theImage=[UIImage imageWithData:imageData];
    //imageText.text=textOfImage;
    //pickenImage.image=theImage;
    
    
    
    NSString *docsDir;
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
    
    //[filemgr release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)dealloc{
  //Doesn't allow me to release, cause error if has release code
    //[pickenImage release];
    //[imageText release];
    //[textField1 release];
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

- (IBAction)grabSavedImage:(id)sender {
    self.imgPicker=[[UIImagePickerController alloc]init];
    imgPicker.delegate=self;
    self.imgPicker.allowsImageEditing=YES;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:self.imgPicker animated:YES];
}

- (IBAction)save:(id)sender {
    
        /*sqlite3_stmt    *statement;
        
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CONTACTS (itemName, itemFile) VALUES (\"%@\", \"%@\")", itemName.text, itemFile.png];
            
            const char *insert_stmt = [insertSQL UTF8String];
            
            sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                textField1.text = @"Contact added";
                //name.text = @"";
                //address.text = @"";
                //phone.text = @"";
            } else {
                status.text = @"Failed to add picture";
            }
            sqlite3_finalize(statement);
            sqlite3_close(contactDB);
        }
*/
    [imageText resignFirstResponder];
    NSString *textOfImage=[imageText text];
    UIImage *theImage=pickenImage.image;
    NSData *imageData=UIImageJPEGRepresentation(theImage, 150);
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:textOfImage forKey:@"textOfImage"];
    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];
    NSLog(@"data saved");
    [self saveTheImage];
    
}
-(void) saveTheImage
{
    UIImage *theImage=pickenImage.image;
    NSData *pictureData=UIImagePNGRepresentation(theImage);
    sqlite3_stmt    *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &imageDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO IMAGES (imageText, pickenImage) VALUES (\"%@\", \"%@\")", [imageText.text, pickenImage.png];//,.png]; need to figure out what to put in front of .png
                        
    
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(imageDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            textField1.text = @"Image added";
            //name.text = @"";
            //address.text = @"";
            //phone.text = @"";
        } else {
            loaded.text = @"Failed to add picture";
        }
        sqlite3_finalize(statement);
        sqlite3_close(imageDB);
    }

}

//the code below may not be correct or needed. need to deal later
-(void)saveImage:(UIImage*)theImage: (NSString*)textOfImage{

    //INSERT INTO items VALUES(whatever the name of the image, name of the file)
    NSData *pictureData=UIImagePNGRepresentation(theImage);
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", textOfImage]]; //add our image to the path
    
    [fileManager createFileAtPath:fullPath contents:pictureData attributes:nil]; //finally save the path (image)
    
    NSLog(@"image saved");
    /*http://www.friendlydeveloper.com/2010/02/using-nsfilemanager-to-save-an-image-to-or-loadremove-an-image-from-documents-directory-coding/
     */

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissModalViewControllerAnimated:YES];
    
    pickenImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
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
    [self presentModalViewController:imgPicker animated:YES];
    //
}

- (IBAction)findImage:(id)sender {
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

@end
