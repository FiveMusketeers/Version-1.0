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

- (IBAction)pictureDelete{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        PictureDeleteViewController *PictureDelete = [[PictureDeleteViewController alloc]initWithNibName:@"PictureDeleteViewController_iPhone" bundle:nil];
        [self presentModalViewController:PictureDelete animated:YES];
    }
    else{
        CreatePictureViewController *Create = [[CreatePictureViewController alloc]initWithNibName:@"CreatePictureViewController_iPad" bundle:nil];
        [self presentModalViewController:Create animated:YES];
    }
}


- (IBAction)pictureCreate {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        CreatePictureViewController *Create = [[CreatePictureViewController alloc]initWithNibName:@"CreatePictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:Create animated:YES];
    }
    else{
        CreatePictureViewController *Create = [[CreatePictureViewController alloc]initWithNibName:@"CreatePictureViewController_iPad" bundle:nil];
        [self presentModalViewController:Create animated:YES];
    }
}

- (IBAction)pictureEdit {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        EditPictureViewController *pictureEdit = [[EditPictureViewController alloc]initWithNibName:@"EditPictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:pictureEdit animated:YES];
    }
    else{
        EditPictureViewController *pictureEdit = [[EditPictureViewController alloc]initWithNibName:@"EditPictureViewController_iPad" bundle:nil];
        [self presentModalViewController:pictureEdit animated:YES];
    }
}

- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
