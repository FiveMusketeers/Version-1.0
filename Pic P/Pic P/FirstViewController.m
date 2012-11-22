//
//  FirstViewController.m
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "PictureViewController.h"
#import "ShareViewController.h"


@interface FirstViewController ()
@end


@implementation FirstViewController
							
- (void)viewDidLoad
{
    [super viewDidLoad];
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
        SecondViewController *secondView = [[SecondViewController alloc]initWithNibName:@"SecondViewController_iPhone" bundle:nil];
        [self presentModalViewController:secondView animated:YES];  
}


- (IBAction)managePictures{
        PictureViewController *PictureView = [[PictureViewController alloc]initWithNibName:@"PictureViewController_iPhone" bundle:nil];
        [self presentModalViewController:PictureView animated:YES];
}

- (IBAction)share{
        ShareViewController *ShareView = [[ShareViewController alloc]initWithNibName:@"ShareViewController_iPhone" bundle:nil];
        [self presentModalViewController:ShareView animated:YES];
}


@end;
