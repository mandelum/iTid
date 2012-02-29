//
//  EditActivityViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import <UIKit/UIKit.h>
//#import "ActivitesListViewController.h"
#import "Activity.h"
#import "TimePickerViewController.h"
#import "GalleryViewController.h"
#import "ColorPickerViewController.h"
@class EditActivityViewController;
@protocol EditActivityDelegate <NSObject>

-(void)saveFrom:(EditActivityViewController *)delegator withActivity:(Activity *)activity;	

@end
@interface EditActivityViewController : UITableViewController <UITextFieldDelegate, UIActionSheetDelegate, GalleryViewControllerDelegate, TimePickerViewControllerDelegate, ColorPickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameOfActivity;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UISwitch *preparationSwitch;
@property (weak, nonatomic) IBOutlet UILabel *preparationTimeAndAlarm;

@property (weak, nonatomic) IBOutlet UILabel *startTimeAndAlarm;

@property (weak, nonatomic) IBOutlet UISwitch *endSwitch;
@property (weak, nonatomic) IBOutlet UILabel *endTimeAndAlarm;

@property (weak, nonatomic) IBOutlet UISwitch *tailSwitch;
@property (weak, nonatomic) IBOutlet UILabel *tailTimeAndAlarm;


@property (strong, nonatomic) Activity *activity;

@property (weak, nonatomic) id <EditActivityDelegate> delegate;


-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)delete:(id)sender;





@end
