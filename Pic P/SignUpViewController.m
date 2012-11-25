//
//  SignUpViewController.m
//  Pic P
//
//  Created by Minhaj Samsudeen on 11/20/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize userName;
@synthesize password;
@synthesize confirmPassword;
@synthesize regiser;
@synthesize cancel;
@synthesize feedback;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //feedback.text = @"test";
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)userName:(id)sender
{
}

- (IBAction)password:(id)sender
{
}
- (IBAction)confrimPassword:(id)sender
{
}

- (IBAction)rgister:(id)sender
{
     
    if (![self.password.text isEqualToString:self.confirmPassword.text]){
        feedback.text = @"Please re-enter password.";
    }
    
    else if ([self.userName.text isEqualToString:@""] ||[self.password.text isEqualToString:@""] ||[self.confirmPassword.text isEqualToString:@""]){
         feedback.text = @"Fields cannot be empty.";      
    }
    
    else{
    
    NSUserDefaults* userData = [NSUserDefaults standardUserDefaults];
    [userData setObject:self.userName.text forKey:@"username"];
        
    [userData setObject:self.password.text forKey:@"password"];
    [userData setObject:@"SortByAlphabet" forKey:@"sortMethod"];
        
    [userData synchronize];
    
    NSString *urlstr = [[NSString alloc] initWithFormat: @"http://picsp.0fees.net/register.php?username=%@&password=%@",self.userName.text, self.password.text];
    NSURL *url = [[NSURL alloc] initWithString:urlstr];
    NSString *ans = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    [sender resignFirstResponder];
    NSLog(ans);
    feedback.text = ans;
    AuthenticationViewController *authenticationView = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:nil];
        [self presentModalViewController:authenticationView animated:YES];
    }
}

- (IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)cancel:(id)sender
{
    AuthenticationViewController *authenticationView = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:nil];
    [self presentModalViewController:authenticationView animated:YES];
}


@end
