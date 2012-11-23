//
//  PictureAllViewController.m
//  Pic P
//
//  Created by Steven Wong on 11/22/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "PictureAllViewController.h"
#import "CategoryViewController.h"

@interface PictureAllViewController ()

@end

@implementation PictureAllViewController

@synthesize button1, button2, button3, button4, button5;

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
    button1.tag = 1;
    button2.tag = 2;
    button3.tag = 3;
    button4.tag = 4;
    button5.tag = 5;
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

-(IBAction)FindCategory:(UIButton*)sender {
    NSInteger parameter = sender.tag;
    
    CategoryViewController *cvc = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController_iPhone" bundle:nil];
    
    cvc.Category_Num = parameter;
    
    [self presentModalViewController:cvc animated:YES];
    
}

- (IBAction)goBack:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
