//
//  EditActivityViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import <Foundation/Foundation.h>

@interface EditActivityViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NameOfActivity;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)delete:(id)sender;


@end
