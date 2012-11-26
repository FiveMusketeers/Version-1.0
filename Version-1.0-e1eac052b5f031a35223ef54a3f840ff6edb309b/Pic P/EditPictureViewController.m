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
    //NSLog(@"%@", self.pickenItem.name);
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
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //NSMutableArray *array=delegate.items;
    
    NSString *originalPath=pickenItem.imagePath;

    //[array delete:pickenItem];

    [delegate.items removeObject:pickenItem];
    ListItem *object = [[ListItem alloc] initWithName:newText imagePath: originalPath];
    NSLog(@"%@",object.name);
    //[array setValue:pickenItem.name forKey:pickenItem.imagePath];
    [delegate.items addObject:object];
    NSLog(@"data updated");
    [self saveImage:imageFromData.image withImageName:newText];
    
    for (ListItem *item in delegate.items) {
        NSLog(@"%@",item.name);
    }
    
    //SQL Command
    
   
}
- (void)saveImage:(UIImage*)image withImageName:(NSString*)imageName {
    
    NSData *imageData = UIImagePNGRepresentation(image); //convert image into .png format.
    
    NSFileManager *fileManager = [NSFileManager defaultManager];//create instance of NSFileManager
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //create an array and store result of our search for the documents directory in it
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]]; //add our image to the path
    
    [fileManager createFileAtPath:fullPath contents:imageData attributes:nil]; //finally save the path (image)
    
    NSLog(@"image saved at: %@", fullPath);
    
}


- (IBAction)Delete:(id)sender {
    AppDelegate *delegate= (AppDelegate*)[[UIApplication sharedApplication] delegate];

    NSLog(@"Delegate Count: %d Deleting: %@", [delegate.items count], pickenItem.name);
    [delegate.items removeObject:pickenItem];
    NSLog(@"Delegate Count After Deletion: %d", [delegate.items count]);
    //ListItem *object = [[ListItem alloc] initWithName:nil imagePath: nil];
    //[array addObject:object];
    
    NSLog(@"DATA DELETED");
    
    for(ListItem *itemCheck in delegate.items)
    {
        NSLog(@"Is Still in the delegate: %@", itemCheck.name);
    }
}

@end
