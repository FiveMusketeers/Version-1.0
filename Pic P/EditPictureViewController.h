//
//  EditPictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPictureViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
}
@property (strong, nonatomic)UIImagePickerController *imagePicker;
@property (strong, nonatomic) IBOutlet UITextField *textOfImage;

@property (weak, nonatomic) IBOutlet UIImageView *imageFromData;
- (IBAction)chooseImageFromData:(id)sender;
- (IBAction)editText:(id)sender;

- (IBAction)PreviousMenu:(id)sender;

- (IBAction)Save:(id)sender;
@end
