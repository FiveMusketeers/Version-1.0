//
//  AppDelegate.h
//  Pic P
//
//  Created by Ouyang Zhou on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    // Database variables
    NSString *databaseName;
    NSString *databasePath;
    
    // Array to store the picture objects
    NSMutableArray *items;
    
    // Array to store lists.
    NSMutableArray *lists;
    
    // Dictionary to store lists. They will be keyed with their name.
    NSMutableDictionary *listDictionary;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSMutableArray *lists;
@property (strong, nonatomic) NSMutableDictionary *listDictionary;
// I made this so I can call a view change via a tableCell
@property (strong, nonatomic) UIViewController *viewControllerOne;

//Stuff Steven Needs
@property (strong, nonatomic) NSMutableArray *listToAdd;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic, assign) int listPicChosen;

@end
