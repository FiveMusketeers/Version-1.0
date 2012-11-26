//
//  ListCreateViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//


//Adding a picture for the list image still needs to be implemented.

//Need to change the save method to update the listsDictionary and listsArray

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "OurButton.h"

@interface ListCreateViewController : UIViewController{
    IBOutlet UITextField *textField1;
    IBOutlet OurButton *listPicture;
    AppDelegate *delegate;
}

@property(nonatomic, retain) IBOutlet UITextField *textField1;
@property(nonatomic, retain) IBOutlet OurButton *listPicture;
@property(nonatomic, retain) AppDelegate *delegate;
@property(nonatomic, retain) NSMutableArray *listToAdd;
@property(nonatomic, retain) NSMutableArray *lists;
@property(nonatomic, retain) NSMutableDictionary *listDictionary;
@property(strong, nonatomic) NSString *databasePath;

- (IBAction) textFieldReturn:(id)sender;
- (IBAction) goToViewPictures:(id) sender;
- (IBAction) save;
- (IBAction)PreviousMenu:(id)sender;

@end
