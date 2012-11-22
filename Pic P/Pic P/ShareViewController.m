//
//  ShareViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "ShareViewController.h"

#import "ShareCategoriesViewController.h"
#import "SharePicturesViewController.h"
#import "ShareListsViewController.h"



@interface ShareViewController ()

@end

@implementation ShareViewController


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

- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)shareLists {
        ShareListsViewController *shareLists = [[ShareListsViewController alloc]initWithNibName:@"ShareListsViewController_iPhone" bundle:nil];
        [self presentModalViewController:shareLists animated:YES];
}


- (IBAction)sharePictures {
        SharePicturesViewController *sharePictures = [[SharePicturesViewController alloc]initWithNibName:@"SharePicturesViewController_iPhone" bundle:nil];
        [self presentModalViewController:sharePictures animated:YES];
}

@end
