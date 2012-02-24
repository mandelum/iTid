//
//  EditActivityViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import "EditActivityViewController.h"


@implementation EditActivityViewController
@synthesize preparationSwitch = _preperationSwitch;
@synthesize endSwitch = _endSwitch;
@synthesize endingTailSwitch = _endingTailSwitch;
@synthesize nameOfActivity = _nameOfActivity;
@synthesize activity = _activity;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (void)setupActivity
{
    NSLog(@"%@", self.nameOfActivity.text);
    NSLog(@"%@", self.activity.name);
    self.nameOfActivity.text = self.activity.name;
    NSLog(@"%@", self.nameOfActivity.text);

}

- (IBAction)delete:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)save:(id)sender {
    
    //[self.activity.managedObjectContext performBlock:^{
        
    if ([self.title isEqualToString:@"Ny Aktivitet"])
        {
        NSLog(@"innuti ny aktivitet insertion");
        
        }
    self.activity.name = self.nameOfActivity.text; 
    NSError *error = nil;
    [self.activity.managedObjectContext save:&error];
    //NSLog(error);
    
        
    //}];
    [self.navigationController popViewControllerAnimated:YES];
        
}
- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    self.nameOfActivity.delegate = self;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self setupActivity];
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
