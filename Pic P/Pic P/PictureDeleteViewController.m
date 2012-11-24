//
//  PIctureDeleteViewController.m
//  Pic P
//
//  Created by Steven Wong on 11/6/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "PictureDeleteViewController.h"
#import "AppDelegate.h"
#import "ListItem.h"
@interface PictureDeleteViewController ()

@end

@implementation PictureDeleteViewController
@synthesize textOfImage;
@synthesize chosenImage;

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
   AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    //NSString *imagePath = [delegate.imageList objectForKey:@"UIImagePickerControllerReferenceURL"];
    
    //NSLog( @"ImagePath: %@", imagePath );
    
    NSDictionary *dictionary=delegate.imageList;
    id d;
    for (d in dictionary)
    {
        ListItem *object = d;
        NSString *theName=object.name;
        NSLog(theName);
        NSLog(object.imagePath);
        //NSData *data = [NSData dataWithContentsOfURL:[dictionary objectForKey:@"UIImagePickerControllerReferenceURL"]];
        //NSLog(@"length %d",[data length]);
        //NSLog(@"data %@",[data description]);
        
       //NSString *imageName = [imagePath lastPathComponent];
        //textOfImage.text=imageName;
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setChosenImage:nil];
    [self setTextOfImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pickImage:(id)sender {
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSDictionary *dictionary=delegate.imageList;
}

- (IBAction)getText:(id)sender {
}

- (IBAction)deleteImage:(id)sender {
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
