//
//  APTableViewController.h
//  Lesson 35 HW 2
//
//  Created by Alex on 19.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APStudent.h"
#import "NSDate+RandomDate.h"
#import "APStudentCell.h"
#import "APSection.h"

@interface APTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (weak, nonatomic) IBOutlet UISegmentedControl *sortingSegmentedControl;


- (IBAction)actionSortingTypeChanged:(UISegmentedControl *)sender;



@end
