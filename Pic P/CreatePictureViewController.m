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
@synthesize imgPicker;
// List Item Properties that need to be filled out
@synthesize imageText;
@synthesize imagePath;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *textOfImage=[defaults objectForKey:@"textOfImage"];
    
    NSData *imageData=[defaults dataForKey:@"image"];
    
    UIImage *theImage=[UIImage imageWithData:imageData];
    
    imageText.text=textOfImage;
    
    pickenImage.image=theImage;
    
    //[filemgr release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    button = nil;
    [self setPickenImage:nil];
    [self setImageText:nil];
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
 
    NSString *textOfImage = [imageText text];
    
    if ( [textOfImage isEqualToString: @" "] || [textOfImage isEqualToString: @""] || textOfImage == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Enter a picture name"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if (pickenImage.image == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Enter a picture"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [imageText resignFirstResponder];
        
        NSLog(@"imageText %@", [imageText text]);
        
        //   NSString *textOfImage = [imageText text];
        NSString *textOfImagePath = [textOfImage stringByAppendingString:@".png"];
        
        ListItem *object = [[ListItem alloc] initWithName:textOfImage imagePath: textOfImagePath];
        NSLog(@"Item Name : %@ Item Path : %@", textOfImage, textOfImagePath);
        AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSMutableArray *array = delegate.items;
        [array addObject: object];
        
        NSLog(@"data saved");
        NSLog(@"%@",textOfImage);
        
        for (ListItem *item in delegate.items) {
            NSLog(@"%@",item.imagePath);
        }
        [self saveImage:pickenImage.image withImageName:textOfImage];
        
        //SQL Command
        
        //Define Database
        sqlite3 *database;
        
        //Create command and statement for SQL
        NSString *sqlCommand = [NSString stringWithFormat:@"INSERT INTO food VALUES ('%@', '%@.png')", textOfImage, textOfImage];
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
                    NSLog(@"value inserted into food");
                }
            }
            
            //Check for error
            else
            {
                NSLog( @"Prepare-error: #%i: %s", result, sqlite3_errmsg( database ) );
            }
            sqlite3_finalize(compiledStatement);
            sqlite3_close(database);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"Saved"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [self dismissModalViewControllerAnimated:YES];
        }
    }
    
    

}

- (void)saveImage:(UIImage*)image withImageName:(NSString*)imageName {
    
    NSData *imageData = UIImagePNGRepresentation(image); //convert image into .png format.
    
    NSFileManager *fileManager = [NSFileManager defaultManager];//create instance of NSFileManager
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //create an array and store result of our search for the documents directory in it
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]]; //add our image to the path
    
    [fileManager createFileAtPath:fullPath contents:imageData attributes:nil]; //finally save the path (image)
    
    NSLog(@"image saved at: %@", fullPath);
    
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

@end
