//
//  TimePickerViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import <UIKit/UIKit.h>
#import "Timepoint.h"
#import "Activity.h"
@class TimePickerViewController;
@protocol TimePickerViewControllerDelegate <NSObject>
-(void)thisTime:(Timepoint *)timePoint with:(NSString *)type fromMe:(id)sender;
@end

@interface TimePickerViewController : UITableViewController
@property (strong,nonatomic) Timepoint *timePoint;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UISwitch *alarmSwitch;
@property (weak, nonatomic) IBOutlet UITableViewCell *soundNameLabel;
@property (weak,nonatomic) id <TimePickerViewControllerDelegate> delegate;
@property (weak, nonatomic) NSString *type;
@property (weak, nonatomic) Activity *activity;
@end
