//
//  CreatePictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreatePictureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *button;
    IBOutlet UITextField *imageText;
    IBOutlet UILabel *loaded;
    
}

@property (nonatomic, strong) UIImagePickerController *imgPicker;
@property (strong, nonatomic) IBOutlet UIImageView *pickenImage;

@property (strong, nonatomic) IBOutlet UITextField *textField1;

@property (nonatomic, retain) IBOutlet UITextField *imageText;

@property (strong, nonatomic)IBOutlet UILabel *loaded;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)grabSavedImage:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)PreviousMenu:(id)sender;


//database action
//- (IBAction)save:(id)sender;
- (IBAction)load:(id)sender;
- (IBAction)dismiss:(id)sender;
//- (IBAction)textFieldReturn:(id)sender;
@end
