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
    IBOutlet UIImageView *image0;
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
    IBOutlet UIImageView *image4;
    IBOutlet UIImageView *image5;
    IBOutlet UIImageView *image6;
    IBOutlet UIImageView *image7;
    IBOutlet UIImageView *image8;
    NSInteger Category_Num;
    NSInteger PicturePosition;
    NSInteger LowerBound;
    NSInteger UpperBound;
}

@property(nonatomic, retain) IBOutlet UILabel *Title;
@property(nonatomic, retain) IBOutlet UIImageView *image0;
@property(nonatomic, retain) IBOutlet UIImageView *image1;
@property(nonatomic, retain) IBOutlet UIImageView *image2;
@property(nonatomic, retain) IBOutlet UIImageView *image3;
@property(nonatomic, retain) IBOutlet UIImageView *image4;
@property(nonatomic, retain) IBOutlet UIImageView *image5;
@property(nonatomic, retain) IBOutlet UIImageView *image6;
@property(nonatomic, retain) IBOutlet UIImageView *image7;
@property(nonatomic, retain) IBOutlet UIImageView *image8;
@property(nonatomic, assign) NSInteger Category_Num;
@property(nonatomic, assign) NSInteger PicturePosition;
@property(nonatomic, assign) NSInteger LowerBound;
@property(nonatomic, assign) NSInteger UpperBound;
@property(nonatomic, assign) NSMutableArray *items;

- (IBAction)goBack;

@property (strong, nonatomic) NSArray *tableData;

@end
