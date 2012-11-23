//
//  CategoryViewController.h
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CategoryViewController : UIViewController <UITableViewDataSource>
{
    IBOutlet UILabel *Title;
    IBOutlet UIButton *image0;
    IBOutlet UIButton *image1;
    IBOutlet UIButton *image2;
    IBOutlet UIButton *image3;
    IBOutlet UIButton *image4;
    IBOutlet UIButton *image5;
    IBOutlet UIButton *image6;
    IBOutlet UIButton *image7;
    IBOutlet UIButton *image8;
    NSInteger Category_Num;
    NSInteger PicturePosition;
    NSInteger LowerBound;
    NSInteger UpperBound;
}

@property(nonatomic, retain) IBOutlet UILabel *Title;
@property(nonatomic, retain) IBOutlet UIButton *image0;
@property(nonatomic, retain) IBOutlet UIButton *image1;
@property(nonatomic, retain) IBOutlet UIButton *image2;
@property(nonatomic, retain) IBOutlet UIButton *image3;
@property(nonatomic, retain) IBOutlet UIButton *image4;
@property(nonatomic, retain) IBOutlet UIButton *image5;
@property(nonatomic, retain) IBOutlet UIButton *image6;
@property(nonatomic, retain) IBOutlet UIButton *image7;
@property(nonatomic, retain) IBOutlet UIButton *image8;
@property(nonatomic, assign) NSInteger Category_Num;
@property(nonatomic, assign) NSInteger PicturePosition;
@property(nonatomic, assign) NSInteger LowerBound;
@property(nonatomic, assign) NSInteger UpperBound;
@property(nonatomic, assign) NSMutableArray *items;

- (IBAction)next;
- (IBAction)previous;
- (IBAction)goBack;

@property (strong, nonatomic) NSArray *tableData;

@end
