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
@synthesize imgPicker;
@synthesize textField1;

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

- (IBAction)takePictures:(id)sender {
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissModalViewControllerAnimated:YES];
    
    pickenImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
}

/*
//I am not sure if below is what I am supposed to do
- (void)imageTakerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imgPicker.delegate = self;
    [self presentModalViewController:imgPicker animated:YES];
    
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // You have the image. You can use this to present the image in the next view like you require in `#3`.
    
    [self dismissModalViewControllerAnimated:YES];
}
 */

- (IBAction) textFieldReturn:(id)sender
{
	//Possible to assign textField1.text to some NSString here
    [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
