//
//  ActivitesListViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "EditActivityViewController.h"
@interface ActivitesListViewController : CoreDataTableViewController <EditActivityDelegate>
@property (nonatomic, strong) UIManagedDocument *activityDataBase;

@end
