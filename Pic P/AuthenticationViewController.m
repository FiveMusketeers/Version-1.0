//
//  AuthenticationViewController.m
//  Pic P
//
//  Created by Minhaj Samsudeen on 11/20/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "AuthenticationViewController.h"

@interface AuthenticationViewController ()

@end

@implementation AuthenticationViewController
@synthesize userName;
@synthesize password;
@synthesize login;
@synthesize signUp;
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

-(IBAction)signUp:(id)sender
{
    SignUpViewController *SignUpView = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self presentModalViewController:SignUpView animated:YES];
    
}

- (IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)login:(id)sender
{
   if ([self.userName.text isEqualToString:@""] ||[self.password.text isEqualToString:@""]){
        feedback.text = @"Fields cannot be empty.";
    }
    
    else{
        
        NSUserDefaults* userData = [NSUserDefaults standardUserDefaults];
        [userData setObject:self.userName.text forKey:@"username"];
        
        [userData setObject:self.password.text forKey:@"password"];
        [userData setObject:@"SortByAlphabet" forKey:@"sortMethod"];
        
        [userData synchronize];
        
        // define your form fields here:
        NSString *content = [[NSString alloc] initWithFormat: @"username=%@&password=%@",self.userName.text, self.password.text];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://picsp.0fees.net/login_exec.php"]];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[content dataUsingEncoding:NSISOLatin1StringEncoding]];
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *responseString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"response: %@",responseString);
        
        if ([userName.text isEqualToString: responseString]){
            FirstViewController *firstView = [[FirstViewController alloc]initWithNibName:@"FirstViewController_iPhone" bundle:nil];
            [self presentModalViewController:firstView animated:YES];
            feedback.text = @"Login sucessful";
            
        }
        else{
            feedback.text = @"Login failed";
        }
        
//        NSString *urlstr = [[NSString alloc] initWithFormat: @"http://picsp.0fees.net/username=%@&password=%@",self.userName.text, self.password.text];
//        NSURL *url = [[NSURL alloc] initWithString:urlstr];
//        NSConnection *ans = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//        [sender resignFirstResponder];
//        NSLog(ans);
//        feedback.text = ans;
//        if ([userName.text isEqualToString: ans]){
//            FirstViewController *firstView = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
//            [self presentModalViewController:firstView animated:YES];
//        }
    }
}

@end
