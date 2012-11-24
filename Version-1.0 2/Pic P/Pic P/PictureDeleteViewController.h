//
//  pictureDeleteViewController.h
//  Pic P
//
//  Created by Minhaj Samsudeen on 12-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureDeleteViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (nonatomic, strong) UIImagePickerController *deleteImagePicker;

@property (strong, nonatomic) IBOutlet UITextField *textOfImage;
@property (strong, nonatomic) IBOutlet UIImageView *chosenImage;
- (IBAction)pickImage:(id)sender;
- (IBAction)getText:(id)sender;

- (IBAction)deleteImage:(id)sender;

- (IBAction)PreviousMenu:(id)sender;
@end
