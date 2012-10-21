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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ShareListsViewController *shareLists = [[ShareListsViewController alloc]initWithNibName:@"ShareListsViewController_iPhone" bundle:nil];
        [self presentModalViewController:shareLists animated:YES];
    }
    else{
        ShareListsViewController *shareLists = [[ShareListsViewController alloc]initWithNibName:@"ShareListsViewController_iPad" bundle:nil];
        [self presentModalViewController:shareLists animated:YES];
    }
}

- (IBAction)shareCategories {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ShareCategoriesViewController *shareCategories = [[ShareCategoriesViewController alloc]initWithNibName:@"ShareCategoriesViewController__iPhone" bundle:nil];
        [self presentModalViewController:shareCategories animated:YES];
    }
    else{
        ShareCategoriesViewController *shareCategories = [[ShareCategoriesViewController alloc]initWithNibName:@"ShareCategoriesViewController__iPad" bundle:nil];
        [self presentModalViewController:shareCategories animated:YES];
    }
}

- (IBAction)sharePictures {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        SharePicturesViewController *sharePictures = [[SharePicturesViewController alloc]initWithNibName:@"SharePicturesViewController_iPhone" bundle:nil];
        [self presentModalViewController:sharePictures animated:YES];
    }
    else{
        SharePicturesViewController *sharePictures = [[SharePicturesViewController alloc]initWithNibName:@"SharePicturesViewController_iPad" bundle:nil];
        [self presentModalViewController:sharePictures animated:YES];
    }
}

@end
