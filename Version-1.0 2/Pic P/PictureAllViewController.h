//
//  PictureAllViewController.h
//  Pic P
//
//  Created by Steven Wong on 11/22/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureAllViewController : UIViewController{

    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *button4;
    IBOutlet UIButton *button5;
}


@property(nonatomic, retain) IBOutlet UIButton *button1;
@property(nonatomic, retain) IBOutlet UIButton *button2;
@property(nonatomic, retain) IBOutlet UIButton *button3;
@property(nonatomic, retain) IBOutlet UIButton *button4;
@property(nonatomic, retain) IBOutlet UIButton *button5;


-(IBAction)FindCategory:(UIButton*)sender;

-(IBAction)goBack:(id)sender;

@end
