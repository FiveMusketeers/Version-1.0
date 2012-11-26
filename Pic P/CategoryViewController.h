//
//  CategoryViewController.h
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

//Overwritten to be Steven's Version

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "OurButton.h"


@interface CategoryViewController : UIViewController <UITableViewDataSource>
{
    BOOL isCreating;
    IBOutlet UILabel *Title;
    IBOutlet OurButton *image0;
    IBOutlet OurButton *image1;
    IBOutlet OurButton *image2;
    IBOutlet OurButton *image3;
    IBOutlet OurButton *image4;
    IBOutlet OurButton *image5;
    IBOutlet OurButton *image6;
    IBOutlet OurButton *image7;
    IBOutlet OurButton *image8;
    NSInteger Category_Num;
    NSInteger PicturePosition;
    NSInteger LowerBound;
    NSInteger UpperBound;
    AppDelegate *delegate;
}

@property(nonatomic, assign) BOOL isCreating;
@property(nonatomic, retain) IBOutlet UILabel *Title;
@property(nonatomic, retain) IBOutlet OurButton *image0;
@property(nonatomic, retain) IBOutlet OurButton *image1;
@property(nonatomic, retain) IBOutlet OurButton *image2;
@property(nonatomic, retain) IBOutlet OurButton *image3;
@property(nonatomic, retain) IBOutlet OurButton *image4;
@property(nonatomic, retain) IBOutlet OurButton *image5;
@property(nonatomic, retain) IBOutlet OurButton *image6;
@property(nonatomic, retain) IBOutlet OurButton *image7;
@property(nonatomic, retain) IBOutlet OurButton *image8;
@property(nonatomic, assign) NSInteger Category_Num;
@property(nonatomic, assign) NSInteger PicturePosition;
@property(nonatomic, assign) NSInteger LowerBound;
@property(nonatomic, assign) NSInteger UpperBound;
@property(nonatomic, assign) NSMutableArray *items;
@property(nonatomic, assign) NSMutableArray *listToAdd;
@property(nonatomic, assign) AppDelegate *delegate;

- (void)loadPictures;
- (IBAction)select:(OurButton*) buttonSelected;
- (IBAction)next;
- (IBAction)previous;
- (IBAction)goBack;

@property (strong, nonatomic) NSArray *tableData;

@end
