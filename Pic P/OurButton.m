//
//  OurButton.m
//  Pic P
//
//  Created by Steven Wong on 11/23/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "OurButton.h"

@implementation OurButton

@synthesize imageNamed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/




-(void)setImageName: (NSString*) name{
    imageNamed = name;
}
-(NSString*)getImageName{
    return imageNamed;
}




-(void)setImageFile:(NSString *)file{
    imageFile = file;
}
-(NSString*)getImageFile{
    return imageFile;
}

@end
