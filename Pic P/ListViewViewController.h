//
//  ListViewViewController.h
//  Pic P
//
//  Created by Steven Wong on 10/18/12.
//  Copyright (c) 2012 Five Musketeers. All rights reserved.
//


/*READDDDDD #######################
/We need to make it so it reads lists that were created.
 /We should do this by modifying the create list methods, so that they affect the dictionary
 */

#import <UIKit/UIKit.h>
#import <Slt/Slt.h>
#import <OpenEars/FliteController.h>

@interface ListViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	FliteController *fliteController;
    Slt *slt;
    IBOutlet UILabel *title;
    IBOutlet UITextField *listName;
    IBOutlet UIButton *saveButton;
}

- (IBAction) PreviousMenu:(id)sender;
- (IBAction) textFieldReturn:(id)sender;
- (IBAction) saveName;

// Text to speech framework.
@property (strong, nonatomic) FliteController *fliteController;
@property (strong, nonatomic) Slt *slt;
// End of text to speech framework.
@property (strong, nonatomic) IBOutlet UITextField *listName;
@property (strong, nonatomic) IBOutlet UITableView *ListTable;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) NSMutableArray *tableData;
@property (nonatomic, assign) BOOL * displayLists;
@property (nonatomic, assign) BOOL * shareLists;
@property (nonatomic, assign) NSString *tableName;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;


@end
