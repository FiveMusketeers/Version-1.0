//
//  ListViewViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewViewController : UIViewController <UITableViewDataSource>
{
	
}

- (IBAction)PreviousMenu:(id)sender;


@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) IBOutlet UITableView *ListTable;
@property (nonatomic, assign) BOOL * displayLists;

@end
