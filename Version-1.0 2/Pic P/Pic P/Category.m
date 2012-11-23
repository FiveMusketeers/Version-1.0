//
//  Category.m
//  Pic P
//
//  Created by Levon Powell on 2012-10-22.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

// The category will contain an array of ListItems.

#import "Category.h"
// When we query for the ListItems, we'll probably want this import.
#import "ListItem.h"

@implementation Category

@synthesize categoryName;
// Listing is the NSArray containing all the entries
@synthesize listing;
@synthesize imagePath;

// Construtor.
-(id)initWithName:(NSString *)newName imagePath:(NSString *)newImagePath
{
	self.categoryName = newName;
	self.imagePath = newImagePath;
	
	return self;
	
	// From here, find all the list items via sql query.
}

// This is an alias, pretending to be the getter for a non-existant method.
- (UIImage *)getImage
{
	// Given a URL, aka imagepath, return the image associated with it.
	
	return [UIImage imageNamed: self.imagePath ];
}

@end
