//
//  ListCell.h
//  Pic P
//
//  Created by Levon Powell on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Slt/Slt.h>
#import <OpenEars/FliteController.h>

@interface ListCell : UITableViewCell
{
	FliteController *fliteController;
    Slt *slt;
}

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) FliteController *fliteController;
@property (strong, nonatomic) Slt *slt;
@property (nonatomic, assign) BOOL * controllerContext;

-(IBAction) Act_voice: (id) sender;

@end

