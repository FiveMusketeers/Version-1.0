//
//  EditPictureViewController.m
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "EditPictureViewController.h"
#import "AppDelegate.h"
#import "ListItem.h"

@interface EditPictureViewController ()

@end

@implementation EditPictureViewController
@synthesize textOfImage;
@synthesize imageFromData;
@synthesize pickenItem;

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
    textOfImage.text = self.pickenItem.name;
    ListItem *item=self.pickenItem;
    imageFromData.image=[UIImage imageNamed:item.name];
    
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

- (IBAction)editText:(id)sender {
        //Possible to assign textField1.text to some NSString here
        [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)update:(id)sender {
   NSString *sqlCommand = @"DELETE FROM items ()";
}

- (IBAction)Delete:(id)sender {
    NSString *sqlCommand = @"Delete FROM items ()";
}

@end
