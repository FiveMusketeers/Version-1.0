//
//  EditPictureViewController.m
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "EditPictureViewController.h"
#import "AppDelegate.h"
@interface EditPictureViewController ()

@end

@implementation EditPictureViewController
@synthesize textOfImage;
@synthesize imageFromData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

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
    [self setImageFromData:nil];
    [self setTextOfImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)chooseImageFromData:(id)sender {
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //NSDictionary *dictionary=delegate.imageList;
}

- (IBAction)editText:(id)sender {
        //Possible to assign textField1.text to some NSString here
        [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)Save:(id)sender {
}
@end
