//
//  CategoryViewViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewViewController : UIViewController

- (IBAction)PreviousMenu:(id)sender;

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) IBOutlet UITableView *listTable;

@end
