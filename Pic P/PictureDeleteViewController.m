//
//  PictureDeleteViewController.m
//  Pic P
//
//  Created by Steven Wong on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "PictureDeleteViewController.h"

@interface PictureDeleteViewController ()

@end

@implementation PictureDeleteViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
