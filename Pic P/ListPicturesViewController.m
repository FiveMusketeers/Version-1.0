//
//  ListPicturesViewController.m
//  Pic P
//
//  Created by Steven Wong on 11/25/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListPicturesViewController.h"
#import "AppDelegate.h"

@interface ListPicturesViewController ()

@end

@implementation ListPicturesViewController

@synthesize pictureOne, pictureThree, pictureTwo, pictureFour, ListPicture, delegate;

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
    
    pictureOne.tag = 1;
    pictureTwo.tag = 2;
    pictureThree.tag = 3;
    pictureFour.tag = 4;
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

- (IBAction)choose:(UIButton*)sender{
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (sender.tag == 1){
        delegate.listPicChosen = 1;
    }
    else if (sender.tag == 2){
        delegate.listPicChosen = 2;
    }
    else if (sender.tag == 3){
        delegate.listPicChosen = 3;
    }
    else if (sender.tag == 4){
        delegate.listPicChosen = 4;
    }
    NSLog(@"Picture #%d chosen", delegate.listPicChosen);
[self dismissModalViewControllerAnimated:TRUE];
}

- (IBAction)goback{
    [self dismissModalViewControllerAnimated:TRUE];
}

@end
