
//  FirstViewController.h
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController{
    IBOutlet UIImageView *img_list;
    IBOutlet UIImageView *img_category;
    IBOutlet UIImageView *img_picture;
    IBOutlet UIImageView *img_share;
}
@property(nonatomic, retain) IBOutlet UIImageView *img_list;
@property(nonatomic, retain) IBOutlet UIImageView *img_category;
@property(nonatomic, retain) IBOutlet UIImageView *img_picture;
@property(nonatomic, retain) IBOutlet UIImageView *img_share;

- (IBAction)manageList;

- (IBAction)manageCategories;

- (IBAction)managePictures;

- (IBAction)share;



@end