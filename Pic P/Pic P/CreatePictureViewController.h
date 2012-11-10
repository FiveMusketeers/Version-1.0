//
//  CreatePictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatePictureViewController : UIViewController{
    UIImagePickerController *imgPicker;
    IBOutlet UIImageView *button;
    
    UIImagePickerController *imagePicker;
    
}
@property (nonatomic, retain)UIImagePickerController *imgPicker;
@property (strong, nonatomic) IBOutlet UIImageView *pickenImage;

@property (nonatomic, retain) UIImagePickerController *imagePicker;



- (IBAction)grabSavedImage:(id)sender;


- (IBAction)takePictures:(id)sender;

- (IBAction)PreviousMenu:(id)sender;
@end
