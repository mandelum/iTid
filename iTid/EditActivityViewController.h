//
//  EditActivityViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import <Foundation/Foundation.h>
#import "ActivitesListViewController.h"
#import "Activity.h"

@interface EditActivityViewController : UITableViewController <UITextFieldDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameOfActivity;
@property (weak, nonatomic) IBOutlet UISwitch *preparationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *endSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *endingTailSwitch;
@property (strong, nonatomic) Activity *activity;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(void)setupActivity;
-(IBAction)delete:(id)sender;
-(IBAction)showActionSheet:(id)sender;





@end
