//
//  CategoryViewController.m
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import "CategoryViewController.h"
#import "AppDelegate.h"
#import "ListItem.h"

#define path1 @""
#define path2 @""
#define path3 @""
#define path4 @""
#define path5 @""

@interface CategoryViewController ()

@end

@implementation CategoryViewController

@synthesize Category_Num, Title, PicturePosition, LowerBound, UpperBound;
@synthesize image0, image1, image2, image3, image4, image5, image6, image7, image8;

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
//    NSLog(@"View Done Load, son.");
    //Sets up the category based on what the user chose
    
    PicturePosition = 0;
    LowerBound = 0;
    UpperBound = LowerBound + 8;
    
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
    
    [self LoadPictures: 0];
}

-(void)LoadPictures:(NSInteger*) firstPosition{
    /*NSString *categoryPath;
    
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
    */
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.items = delegate.items;
    
    
//    for (ListItem *l in self.items){
//        NSLog(@"%@", l.imagePath);
//    }


    while (UpperBound >= PicturePosition){
        ListItem *itemRead = [self.items objectAtIndex:PicturePosition];
        NSString *setPicture = itemRead.imagePath;
  //      NSLog(@"%@", setPicture);
        UIImage *image = [UIImage imageNamed: setPicture];
        if (LowerBound == PicturePosition){
            [image0 setImage:image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 1 == PicturePosition){
            [image1 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 2 == PicturePosition){
            [image2 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 3 == PicturePosition){
            [image3 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 4 == PicturePosition){
            [image4 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 5 == PicturePosition){
            [image5 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 6 == PicturePosition){
            [image6 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 8 == PicturePosition){
            [image7 setImage: image forState:UIButtonTypeCustom];
        }
        else if (LowerBound + 9 == PicturePosition){
            [image8 setImage: image forState:UIButtonTypeCustom];
        }
        PicturePosition = PicturePosition + 1;
    }
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
