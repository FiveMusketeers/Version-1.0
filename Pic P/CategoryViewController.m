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

@synthesize Category_Num, Title, PicturePosition, LowerBound, UpperBound, isCreating;
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
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.listToAdd = delegate.listToAdd;
    
    if (isCreating){
        NSLog(@"Is Creating");
    }
    else{
        NSLog(@"Is viewing");
    }
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
    
    [self LoadPictures];
}

-(void)LoadPictures{
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
    
    self.items = delegate.items;
    
    while (UpperBound >= PicturePosition)
    {
        ListItem *itemRead = [self.items objectAtIndex:PicturePosition];
        
        UIImage *image = [UIImage imageNamed: itemRead.imagePath];
        if (LowerBound == PicturePosition){
            [image0 setImage:image forState:UIButtonTypeCustom];
            [image0 setImageName: itemRead.name];
            [image0 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 1 == PicturePosition){
            [image1 setImage: image forState:UIButtonTypeCustom];
            [image1 setImageName: itemRead.name];
            [image1 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 2 == PicturePosition){
            [image2 setImage: image forState:UIButtonTypeCustom];
            [image2 setImageName: itemRead.name];
            [image2 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 3 == PicturePosition){
            [image3 setImage: image forState:UIButtonTypeCustom];
            [image3 setImageName: itemRead.name];
            [image3 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 4 == PicturePosition){
            [image4 setImage: image forState:UIButtonTypeCustom];
            [image4 setImageName: itemRead.name];
            [image4 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 5 == PicturePosition){
            [image5 setImage: image forState:UIButtonTypeCustom];
            [image5 setImageName: itemRead.name];
            [image5 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 6 == PicturePosition){
            [image6 setImage: image forState:UIButtonTypeCustom];
            [image6 setImageName: itemRead.name];
            [image6 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 7 == PicturePosition){
            [image7 setImage: image forState:UIButtonTypeCustom];
            [image7 setImageName: itemRead.name];
            [image7 setImageFile: itemRead.imagePath];
        }
        else if (LowerBound + 8 == PicturePosition){
            [image8 setImage: image forState:UIButtonTypeCustom];
            [image8 setImageName: itemRead.name];
            [image8 setImageFile: itemRead.imagePath];
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

- (IBAction)select:(OurButton*)buttonSelected;
{
    if (buttonSelected.getImageFile != Nil && buttonSelected.getImageName != Nil)
    {
        if (isCreating){
            NSString *nameToAdd = buttonSelected.getImageName;
            NSString *fileToAdd = buttonSelected.getImageFile;
            
            ListItem *itemToAdd = [[ListItem alloc] initWithName:nameToAdd imagePath:fileToAdd];
            
            NSLog(@"We are adding an item with name %@, and path %@", itemToAdd.name, itemToAdd.imagePath);
            [self.listToAdd addObject:itemToAdd];
        }
        else{
            //Enlarge
        }
    }
    else{
        
    }
}

-(IBAction)previous
{
    
    if ( LowerBound - 9 >= 0)
    {
        LowerBound = LowerBound - 9;
        UpperBound = LowerBound + 8;
        PicturePosition = LowerBound;
        
        [self clearPictures];
        
        [self LoadPictures];
    }
    else
    {
        NSLog(@"Cannot go back any further.");
    }
}

-(IBAction)next
{
    
    if ( UpperBound < [self.items count] - 1 )
    {
        LowerBound = LowerBound + 9;
        UpperBound = MIN([self.items count] - 1, UpperBound + 9);
        PicturePosition = LowerBound;
        
        [self clearPictures];
        
        [self LoadPictures];
    }
    else
    {
        NSLog(@"Cannot go any further.");
    }
    //    NSLog(@"Lowerbound: %d", LowerBound);
    //    NSLog(@"Upperbound: %d", UpperBound);
    //    NSLog(@"Check: %d", (UpperBound + 9));
    //    NSLog(@"Final array position: %d", [self.items count] -1 );
}

-(void)clearPictures
{
    [image0 setImage:nil forState:UIButtonTypeCustom];
    [image1 setImage:nil forState:UIButtonTypeCustom];
    [image2 setImage:nil forState:UIButtonTypeCustom];
    [image3 setImage:nil forState:UIButtonTypeCustom];
    [image4 setImage:nil forState:UIButtonTypeCustom];
    [image5 setImage:nil forState:UIButtonTypeCustom];
    [image6 setImage:nil forState:UIButtonTypeCustom];
    [image7 setImage:nil forState:UIButtonTypeCustom];
    [image8 setImage:nil forState:UIButtonTypeCustom];
    
    [image0 setImageName: nil];
    [image0 setImageFile: nil];
    
    [image1 setImageName: nil];
    [image1 setImageFile: nil];
    
    [image2 setImageName: nil];
    [image2 setImageFile: nil];
    
    [image3 setImageName: nil];
    [image3 setImageFile: nil];
    
    [image4 setImageName: nil];
    [image4 setImageFile: nil];
    
    [image5 setImageName: nil];
    [image5 setImageFile: nil];
    
    [image6 setImageName: nil];
    [image6 setImageFile: nil];
    
    [image7 setImageName: nil];
    [image7 setImageFile: nil];
    
    [image8 setImageName: nil];
    [image8 setImageFile: nil];
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
