//
//  ListViewViewController.m
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListViewViewController.h"

@interface ListViewViewController ()

@end

@implementation ListViewViewController

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
- (IBAction)listView {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"SecondViewController_iPhone" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
    else{
        ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"SecondViewController_iPad" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
}


- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
