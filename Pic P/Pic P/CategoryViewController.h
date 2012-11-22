//
//  CategoryViewController.h
//  MakeTabbed3
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Steven Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITableViewDataSource>
{
    IBOutlet UILabel *Title;
    NSInteger Category_Num;
}

@property(nonatomic, retain) IBOutlet UILabel *Title;
@property(nonatomic, assign) NSInteger Category_Num;

- (IBAction)goBack;

@property (strong, nonatomic) NSArray *tableData;

@end
