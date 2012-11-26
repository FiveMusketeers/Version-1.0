//
//  EditPictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"
@interface EditPictureViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> ListItem

@property (strong, nonatomic)ListItem *pickenItem;
@property (strong, nonatomic)UIImagePickerController *imagePicker;
@property (strong, nonatomic) IBOutlet UITextField *textOfImage;
@property (nonatomic, assign) ListItem *pickAnItem;

@property (weak, nonatomic) IBOutlet UIImageView *imageFromData;
- (IBAction)chooseImageFromData:(id)sender;
- (IBAction)editText:(id)sender;

- (IBAction)PreviousMenu:(id)sender;

- (IBAction)Save:(id)sender;
@end
