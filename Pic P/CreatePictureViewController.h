//
//  CreatePictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "/usr/include/sqlite3.h"

@interface CreatePictureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *button;
    IBOutlet UITextField *imageText;
    IBOutlet UILabel *loaded;
    //sqlite3 *imageDB;
    NSString *databasePath;
    
}

@property (nonatomic, strong) UIImagePickerController *imgPicker;
@property (strong, nonatomic) IBOutlet UIImageView *pickenImage;
@property (nonatomic, assign) NSString *databasePath;
@property (nonatomic, retain) IBOutlet UITextField *imageText;

@property (strong, nonatomic) NSString *imagePath;

//@property (strong, nonatomic)IBOutlet UILabel *loaded;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)grabSavedImage:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)PreviousMenu:(id)sender;
- (IBAction)camera:(id)sender;

//- (IBAction)findImage:(id)sender;


//database action

//- (IBAction)load:(id)sender;
//- (IBAction)dismiss:(id)sender;
//- (IBAction)textFieldReturn:(id)sender;
@end
