//
//  ActivityPickerViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
@interface ActivityPickerViewController : CoreDataTableViewController
@property (nonatomic, strong) UIManagedDocument *activityDataBase;

@end
