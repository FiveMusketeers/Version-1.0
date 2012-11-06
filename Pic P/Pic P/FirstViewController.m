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

@synthesize img_list, img_category, img_picture, img_share;

							
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *menu1_item1 = [UIImage imageNamed:(@"List.png")];
	[img_list setImage: menu1_item1];
    UIImage *menu1_item2 = [UIImage imageNamed:(@"Category.png")];
	[img_category setImage: menu1_item2];
    UIImage *menu1_item3 = [UIImage imageNamed:(@"Picture.png")];
	[img_picture setImage: menu1_item3];
    UIImage *menu1_item4 = [UIImage imageNamed:(@"Share.png")];
	[img_share setImage: menu1_item4];
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

- (IBAction)manageCategories{
        CategoryViewController *categoryView = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController_iPhone" bundle:nil];
        [self presentModalViewController:categoryView animated:YES];
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
