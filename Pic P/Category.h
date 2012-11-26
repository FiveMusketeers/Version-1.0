//
//  Category.h
//  Pic P
//
//  Created by Levon Powell on 2012-10-22.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
{
	// Initialization of local variable space.
	NSArray *listing;
	NSString *categoryName;
	NSString *imagePath;
}

@property(strong, nonatomic) IBOutlet NSArray *listing;
@property(strong, nonatomic) IBOutlet NSString *categoryName;
@property(strong, nonatomic) IBOutlet NSString *imagePath;

-(id)initWithName:(NSString *)newName imagePath:(NSString *)newImagePath; // Constructor.
// This finds and returns the actual photo resource.
// imagePath merely contains the name.
-(UIImage *)getImage;

@end
