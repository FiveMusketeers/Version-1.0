//
//  AppDelegate.h
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{

// Database variables
NSString *databaseName;
NSString *databasePath;

// Array to store the animal objects
NSMutableArray *items;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableDictionary *imageList;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
