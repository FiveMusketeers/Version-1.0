//
//  CategoryViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryAddViewController.h"
#import "CategoryEditViewController.h"
#import "CategoryViewViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

@synthesize tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
	{
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
	else
	{
        return YES;
    }
}



- (IBAction)categoryAdd
{
    CategoryAddViewController *categoryView = [[CategoryAddViewController alloc]initWithNibName:@"CategoryAddViewController_iPhone" bundle:nil];
    [self presentModalViewController:categoryView animated:YES];
}

- (IBAction)categoryEdit
{
    CategoryEditViewController *categoryEdit = [[CategoryEditViewController alloc]initWithNibName:@"CategoryEditViewController_iPhone" bundle:nil];
    [self presentModalViewController:categoryEdit animated:YES];
}

- (IBAction)categoryView
{
    CategoryViewViewController *categoryView = [[CategoryViewViewController alloc]initWithNibName:@"CategoryViewViewController_iPhone" bundle:nil];
    [self presentModalViewController:categoryView animated:YES];
}

- (IBAction)goBack
{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
