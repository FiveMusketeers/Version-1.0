
//  FirstViewController.h
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController

- (IBAction)manageList;

- (IBAction)managePictures;

- (IBAction)share;

-(void)renderListItemsFromCell;

@end