//
//  EditActivityViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import <Foundation/Foundation.h>

@interface EditActivityViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NameOfActivity;
@property (weak, nonatomic) IBOutlet UISwitch *PreperationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *EndSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *EndingTailSwitch;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)delete:(id)sender;



@end
