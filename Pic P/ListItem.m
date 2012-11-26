//
//  ListItem.m
//  Pic P
//
//  Created by Levon Powell on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

@synthesize name;
@synthesize imagePath;

// Construtor.
-(id)initWithName:(NSString *)newName imagePath:(NSString *)newImagePath
{
	self.name = newName;
	self.imagePath = newImagePath;
	
	return self;
}

// This is an alias, pretending to be the getter for a non-existant method.
- (UIImage *)getImage
{
	// Given a URL, aka imagepath, return the image associated with it.
	
	return [UIImage imageNamed: self.imagePath ];
}
@end
