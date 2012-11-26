//
//  ListItem.h
//  Pic P
//
//  Created by Levon Powell on 2012-10-21.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject
{
	NSString *name;
	NSString *imagePath;
}

@property(strong, nonatomic) IBOutlet NSString *name;
@property(strong, nonatomic) IBOutlet NSString *imagePath;

-(id)initWithName:(NSString *)newName imagePath:(NSString *)newImagePath; // Constructor.
// This finds and returns the actual photo resource.
// imagePath merely contains the name.
-(UIImage *)getImage;

- (BOOL)isEqual:(ListItem *)anObject;

@end
