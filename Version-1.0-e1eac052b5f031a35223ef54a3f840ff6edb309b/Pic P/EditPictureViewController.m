//
//  EditPictureViewController.m
//  Pic P
//
//  Created by Charlotte Chak on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "EditPictureViewController.h"
#import "AppDelegate.h"
#import "ListItem.h"
#import "AppDelegate.h"
@interface EditPictureViewController ()

@end

@implementation EditPictureViewController
@synthesize textOfImage;
@synthesize imageFromData;
@synthesize pickenItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"%@", self.pickenItem.name);
    textOfImage.text = self.pickenItem.name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ListItem *item=self.pickenItem;
    NSString *str=textOfImage.text;
   // NSLog(@"1");
   // NSLog(@"%@", str);
    imageFromData.image=[UIImage imageNamed:item.name];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setImageFromData:nil];
    [self setTextOfImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)chooseImageFromData:(id)sender {
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //NSDictionary *dictionary=delegate.imageList;
}

- (IBAction)editText:(id)sender {
        //Possible to assign textField1.text to some NSString here
        [sender resignFirstResponder];
}

- (IBAction)PreviousMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)update:(id)sender {
    NSString *newText=textOfImage.text;
    //pickenItem.name=newText;
    NSString *path=pickenItem.imagePath;
    NSLog(@"1");
     AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSArray *array=delegate.items;
    
    NSString *originalPath=pickenItem.imagePath;
    NSLog(@"2");
    //[array delete:pickenItem];
    [array cut:pickenItem];
    NSLog(@"3");
    ListItem *object = [[ListItem alloc] initWithName:newText imagePath: originalPath];
    //[array setValue:pickenItem.name forKey:pickenItem.imagePath];
    NSLog(@"data updated");
    
    for (ListItem *item in delegate.items) {
        NSLog(@"%@",item.name);
        NSLog(@"%@",item.imagePath);
    }
    
    //SQL Command
    
    NSString *sqlCommand = [NSString stringWithFormat:@"INSERT INTO items VALUES('%@','%@')", pickenItem.name, pickenItem.imagePath];
    

}

- (IBAction)Delete:(id)sender {
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSArray *array=delegate.items;
    [array delete:pickenItem];

}

@end
