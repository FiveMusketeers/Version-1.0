//
//  SecondViewController.m
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "SecondViewController.h"
#import "ListCreateViewController.h"
#import "ListViewViewController.h"
#import "ListEditViewController.h"
#import "CategoryViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//For Lists 
- (IBAction)listCreate {
        ListCreateViewController *listView = [[ListCreateViewController alloc]initWithNibName:@"ListCreateViewController_iPhone" bundle:nil];
        [self presentModalViewController:listView animated:YES];
}

- (IBAction)listEdit {
    ListEditViewController *ListEditView = [[ListEditViewController alloc]initWithNibName:@"ListEditViewController_iPhone" bundle:nil];
    [self presentModalViewController:ListEditView animated:YES];

}

- (IBAction)listView{
    ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"ListViewViewController_iPhone" bundle:nil];
    
    // Since this is the first time this loaded, we want to display only lists as opposed list items.
    listView.displayLists = TRUE;
    listView.shareLists = FALSE;
    
    [self presentModalViewController:listView animated:YES];
}

//Goes to the previous menu
- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
}

@end

