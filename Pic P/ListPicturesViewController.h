//
//  ListPicturesViewController.h
//  Pic P
//
//  Created by Steven Wong on 11/25/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ListPicturesViewController : UIViewController{
    IBOutlet UIButton *pictureOne;
    IBOutlet UIButton *pictureTwo;
    IBOutlet UIButton *pictureThree;
    IBOutlet UIButton *pictureFour;
    NSString *ListPicture;
}

@property (nonatomic, retain) IBOutlet UIButton *pictureOne;
@property (nonatomic, retain) IBOutlet UIButton *pictureTwo;
@property (nonatomic, retain) IBOutlet UIButton *pictureThree;
@property (nonatomic, retain) IBOutlet UIButton *pictureFour;
@property (nonatomic, retain) NSString *ListPicture;
@property (nonatomic, retain) AppDelegate *delegate;

- (IBAction)choose:(UIButton*)sender;
- (IBAction)goback;


@end
