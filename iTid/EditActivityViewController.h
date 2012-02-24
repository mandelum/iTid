//
//  EditActivityViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import <UIKit/UIKit.h>
//#import "ActivitesListViewController.h"
#import "Activity.h"
@class EditActivityViewController;
@protocol EditActivityDelegate <NSObject>

-(void)saveFrom:(EditActivityViewController *)delegator withActivity:(Activity *)activity;	

@end
@interface EditActivityViewController : UITableViewController <UITextFieldDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameOfActivity;
@property (weak, nonatomic) IBOutlet UISwitch *preparationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *endSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *endingTailSwitch;
@property (strong, nonatomic) Activity *activity;
@property (weak, nonatomic) id <EditActivityDelegate> delegate;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)delete:(id)sender;





@end
