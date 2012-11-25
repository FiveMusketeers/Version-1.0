//
//  SignUpViewController.h
//  Pic P
//
//  Created by Minhaj Samsudeen on 11/20/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenticationViewController.h"

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *regiser;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UILabel *feedback;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)rgister:(id)sender;
- (IBAction)cancel:(id)sender;


@end
