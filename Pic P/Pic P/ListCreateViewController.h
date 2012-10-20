//
//  ListCreateViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCreateViewController : UIViewController



//I am only trying to write some code
@property (strong, nonatomic) IBOutlet UITextField *nameOfImage;
- (IBAction)chooseImage:(id)sender;
- (IBAction)save:(id)sender;




- (IBAction)previousMenu:(id)sender;

@end
