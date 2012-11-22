//
//  PictureViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "PictureViewController.h"
#import "CreatePictureViewController.h"
#import "EditPictureViewController.h"
#import "PictureDeleteViewController.h"
#import "AppDelegate.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

- (void)viewDidLoad
{
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSDictionary *dictionary=delegate.imageList;
    NSEnumerator *e=[dictionary objectEnumerator];
    id value;
    id object;
    for (object in [dictionary allKeys])
    {
        value=[dictionary objectForKey:object];
    }
    //while (object=[e nextObject]) {
       // NSString *str = [object valueForKey:@"\"@od\""];
        //NSLog(@"key=%@ value=%@", object, [dictionary objectForKey:object]);
        
    //}
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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


- (IBAction)pictureCreate {
        CreatePictureViewController *Create = [[CreatePictureViewController alloc]initWithNibName:@"CreatePictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:Create animated:YES];
}

- (IBAction)pictureEdit {
        EditPictureViewController *pictureEdit = [[EditPictureViewController alloc]initWithNibName:@"EditPictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:pictureEdit animated:YES];
}

- (IBAction)pictureDelete {
    PictureDeleteViewController *pictureDelete = [[PictureDeleteViewController alloc]initWithNibName:@"PictureDeleteViewController_iPhone" bundle:nil];
    [self presentModalViewController:pictureDelete animated:YES];
}

- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
