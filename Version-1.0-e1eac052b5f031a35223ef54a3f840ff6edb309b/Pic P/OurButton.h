//
//  OurButton.h
//  Pic P
//
//  Created by Steven Wong on 11/23/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OurButton : UIButton{
    NSString *imageFile;
    NSString *imageNamed;
}

@property(nonatomic, retain) NSString *imageNamed;
@property(nonatomic, retain) NSString *imageFile;

//Handles the image name
- (void)setImageName: (NSString*) name;
- (NSString*)getImageName;

//Handles the image file
- (void)setImageFile: (NSString*) file;
- (NSString*)getImageFile;

@end
