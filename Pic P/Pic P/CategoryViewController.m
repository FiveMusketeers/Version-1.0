//
//  CategoryViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "CategoryViewController.h"

#define path1 @""
#define path2 @""
#define path3 @""
#define path4 @""
#define path5 @""

@interface CategoryViewController ()

@end

@implementation CategoryViewController

@synthesize Category_Num, Title;

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
    //Sets up the category based on what the user chose
    if (Category_Num == 1){
        Title.text = @"Food";
    }
    else if (Category_Num == 2){
        Title.text = @"Clothing";
    }
    else if (Category_Num == 3){
        Title.text = @"Hygiene";
    }
    else if (Category_Num == 4){
        Title.text = @"Stationery";
    }
    else if (Category_Num == 5){
        Title.text = @"Other";
    }

    [self LoadPictures];
}

-(void)LoadPictures{
    NSString *categoryPath;
    
    //Find category path
    if (Category_Num == 1){
        NSString *categoryPath = path1;
    }
    else if (Category_Num == 2){
        NSString *categoryPath = path2;
    }
    else if (Category_Num == 3){
        NSString *categoryPath = path3;
    }
    else if (Category_Num == 4){
        NSString *categoryPath = path4;
    }
    else if (Category_Num == 5){
        NSString *categoryPath = path5;
    }

    //Load UIImageView based on Path
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


- (IBAction)goBack
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
