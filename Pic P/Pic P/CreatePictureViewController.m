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
    self.imgPicker=[[UIImagePickerController alloc]init];
    self.imgPicker.allowsImageEditing=YES;
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //[super viewDidLoad];
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

- (IBAction)grabSavedImage:(id)sender {
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
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissModalViewControllerAnimated:YES];
    
    pickenImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
}

- (IBAction)textFieldReturn:(id)sender
{
	//Possible to assign textField1.text to some NSString here
    [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
