//
//  ListCreateViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListCreateViewController.h"

@interface ListCreateViewController ()


@end

@implementation ListCreateViewController
@synthesize nameOfImage;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=NSLocalizedString(@"ListCreate", @"ListCreate");
        self.tabBarItem.image=[UIImage imageNamed:@"listCreate"];
        
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
    //[self setConnectImageView:nil];
    [self setNameOfImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom)==UIUserInterfaceIdiomPhone)
    {
    
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
    else
    {
        return YES;
    }
    
}



//I will try to write some code

- (IBAction)chooseImage:(id)sender {
}

- (IBAction)save:(id)sender {
}

- (IBAction)previousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)viewLists:(id)sender {
    
}

@end


