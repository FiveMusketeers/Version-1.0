//
//  PictureViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "PictureViewController.h"
#import "CreatePictureViewController.h"
#import "PictureAllViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

- (void)viewDidLoad
{
    
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

- (IBAction)pictureView {
        PictureAllViewController *pictureView = [[PictureAllViewController alloc]initWithNibName:@"PictureAllViewController" bundle:nil];
        pictureView.isCreating = false;
        [self presentModalViewController:pictureView animated:YES];
}


- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
