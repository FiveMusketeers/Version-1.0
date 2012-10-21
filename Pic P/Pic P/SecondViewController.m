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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ListCreateViewController *listView = [[ListCreateViewController alloc]initWithNibName:@"ListCreateViewController_iPhone" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
    else{
        ListCreateViewController *listView = [[ListCreateViewController alloc]initWithNibName:@"ListCreateViewController_iPad" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
}

- (IBAction)listEdit {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ListEditViewController *ListEditView = [[ListEditViewController alloc]initWithNibName:@"ListEditViewController_iPhone" bundle:nil];
        [self presentModalViewController:ListEditView animated:YES];
    }
    else{
        ListEditViewController *ListEditView = [[ListEditViewController alloc]initWithNibName:@"ListEditViewController_iPad" bundle:nil];
        [self presentModalViewController:ListEditView animated:YES];
    }
    
}

- (IBAction)listView{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"ListViewViewController_iPhone" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
    else{
        ListViewViewController *listView = [[ListViewViewController alloc]initWithNibName:@"ListViewViewController_iPad" bundle:nil];
        [self presentModalViewController:listView animated:YES];
    }
}


//Goes to the previous menu
- (IBAction)goBack{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end

