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
    
}

@property (nonatomic, strong) UIImagePickerController *imgPicker;
@property (strong, nonatomic) IBOutlet UIImageView *pickenImage;
@property (strong, nonatomic) IBOutlet UITextField *textField1;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)grabSavedImage:(id)sender;
- (IBAction)takePictures:(id)sender;
- (IBAction)PreviousMenu:(id)sender;
@end
