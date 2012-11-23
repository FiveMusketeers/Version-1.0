//
//  ListCreateViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListCreateViewController.h"
#import "PictureAllViewController.h"


@implementation ListCreateViewController

@synthesize textField1;

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

- (IBAction) goToViewPictures:(id)sender{
    PictureAllViewController *pavc = [[PictureAllViewController alloc]initWithNibName:@"PictureAllViewController" bundle:nil];
    
    pavc.isCreating = true;
    
    [self presentModalViewController:pavc animated:YES];
}

- (IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
