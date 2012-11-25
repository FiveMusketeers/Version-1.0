//
//  CategoryViewController.h
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITableViewDataSource>

- (IBAction)categoryAdd;

- (IBAction)goBack;

- (IBAction)categoryEdit;

- (IBAction)categoryView;

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) IBOutlet UITableView *ListTable;

@end
