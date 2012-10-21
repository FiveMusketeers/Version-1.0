//
//  FirstViewController.m
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "CategoryViewController.h"
#import "PictureViewController.h"
#import "ShareViewController.h"


@interface FirstViewController ()
@end


@implementation FirstViewController

							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (IBAction)manageList{
    // Should go to the second view (List View)
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) { 
        SecondViewController *secondView = [[SecondViewController alloc]initWithNibName:@"SecondViewController_iPhone" bundle:nil];
        [self presentModalViewController:secondView animated:YES];
    }
    else{
        SecondViewController *secondView = [[SecondViewController alloc]initWithNibName:@"SecondViewController_iPad" bundle:nil];
        [self presentModalViewController:secondView animated:YES];
    }
    
    
}

- (IBAction)manageCategories{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            CategoryViewController *categoryView = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController_iPhone" bundle:nil];
            [self presentModalViewController:categoryView animated:YES];
        }
        else{
            CategoryViewController *categoryView = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController_iPad" bundle:nil];
            [self presentModalViewController:categoryView animated:YES];
        }
}


- (IBAction)managePictures{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        PictureViewController *PictureView = [[PictureViewController alloc]initWithNibName:@"PictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:PictureView animated:YES];
    }
    else{
        PictureViewController *PictureView = [[PictureViewController alloc]initWithNibName:@"PictureViewController_iPad" bundle:nil];
        [self presentModalViewController:PictureView animated:YES];
    }
}

- (IBAction)share{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ShareViewController *ShareView = [[ShareViewController alloc]initWithNibName:@"ShareViewController_iPhone" bundle:nil];
        [self presentModalViewController:ShareView animated:YES];
    }
    else{
        ShareViewController *ShareView = [[ShareViewController alloc]initWithNibName:@"ShareViewController_iPad" bundle:nil];
        [self presentModalViewController:ShareView animated:YES];
    }
}


@end;
