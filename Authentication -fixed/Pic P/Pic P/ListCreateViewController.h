//
//  ListCreateViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCreateViewController : UIViewController{
    IBOutlet UITextField *textField1;
    IBOutlet UILabel *label1;
    IBOutlet UIImageView *items;
}

@property(nonatomic, retain) IBOutlet UITextField *textField1;
@property(nonatomic, retain) IBOutlet UILabel *label1;
@property(nonatomic, retain) IBOutlet UIImageView *items;

- (IBAction) textFieldReturn:(id)sender;

- (IBAction)PreviousMenu:(id)sender;

@end
