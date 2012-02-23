//
//  EditActivityViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import "EditActivityViewController.h"

@implementation EditActivityViewController
@synthesize PreparationSwitch = _PreperationSwitch;
@synthesize EndSwitch = _EndSwitch;
@synthesize EndingTailSwitch = _EndingTailSwitch;
@synthesize NameOfActivity = _NameOfActivity;
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)delete:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)save:(id)sender {
    [self.navigationController popViewControllerAnimated:YES]e
}
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES]e
    
}
- (void)viewDidLoad {
    self.NameOfActivity.delegate = self;
}
- (void)viewDidUnload {
    [self setNameOfActivity:nil];
    [self setPreparationSwitch:nil];
    [self setEndSwitch:nil];
    [self setEndingTailSwitch:nil];
    [super viewDidUnload];
}
    //
    //Prepare for seque 
    //bakåt, där all info committas
    //

    //Implement Delegate methods that get´s called in their prepareforseque
    //Icon GalleryPicker sends back the correct icon url or database identifier
    //SoundPicker sends back it´s chosen soundtitle/identifier
    //ColorPicker that sends it´s color value
    //Step-Sequence-Picker that sends back an NSArray of steps
    //TimePicker sends a time and a BOOL if alarm is on/off
    //WeekdayPicker sends back 
    //
    

@end
