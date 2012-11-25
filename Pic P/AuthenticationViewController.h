//
//  AuthenticationViewController.h
//  Pic P
//
//  Created by Minhaj Samsudeen on 11/20/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"
#import "FirstViewController.h"

@interface AuthenticationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *signUp;
@property (weak, nonatomic) IBOutlet UILabel *feedback;

-(IBAction)login:(id)sender;
-(IBAction)signUp:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@end
