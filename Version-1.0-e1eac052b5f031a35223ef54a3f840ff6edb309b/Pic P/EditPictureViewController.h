//
//  EditPictureViewController.h
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"
#import "/usr/include/sqlite3.h"

@interface EditPictureViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> 
{
    IBOutlet UIImageView *imageFromData;
    IBOutlet UITextField *textOfImage;
    NSString *databasePath;
}

@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) IBOutlet UITextField *textOfImage;
@property (strong, nonatomic) IBOutlet UIImageView *imageFromData;
@property(strong, nonatomic) ListItem *pickenItem;
@property (nonatomic, assign) NSString *databasePath;


- (IBAction)chooseImageFromData:(id)sender;
- (IBAction)editText:(id)sender;
- (IBAction)PreviousMenu:(id)sender;


- (IBAction)update:(id)sender;
- (IBAction)Delete:(id)sender;

@end
