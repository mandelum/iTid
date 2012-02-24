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
@synthesize delegate = _delegate;

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

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		[self.navigationController popViewControllerAnimated:YES];
        [self.activity.managedObjectContext deleteObject:self.activity];
        [self.delegate saveFrom:self withActivity:self.activity];
	} else if (buttonIndex == 1) {
		NSLog(@"cancel");
	} 		
}

- (IBAction)delete:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Döda mig!!!" delegate:self cancelButtonTitle:@"kanske inte" destructiveButtonTitle:@"DÖÖÖÖD!!!" otherButtonTitles: nil];
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:self.view];

    
}



- (IBAction)save:(id)sender {
    
        
    if ([self.title isEqualToString:@"Ny Aktivitet"])
        {
        NSLog(@"innuti ny aktivitet insertion");
        
        }
    self.activity.name = self.nameOfActivity.text; 
    NSError *error = nil;
    [self.activity.managedObjectContext save:&error];
    [self.delegate saveFrom:self withActivity:self.activity];
    [self.navigationController popViewControllerAnimated:YES];
        
}
- (IBAction)cancel:(id)sender {
    if ([self.title isEqualToString:@"Ny Aktivitet"])
        {
        [self.activity.managedObjectContext deleteObject:self.activity];
        [self.delegate saveFrom:self withActivity:self.activity];

        }
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    self.nameOfActivity.delegate = self;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self setupActivity];
    if ([self.title isEqualToString:@"Ny Aktivitet"])
        {
        [self.nameOfActivity becomeFirstResponder];
        
        }
}
- (void)viewDidUnload {
    [self setNameOfActivity:nil];
    [self setPreparationSwitch:nil];
    [self setEndSwitch:nil];
    [self setEndingTailSwitch:nil];
    [super viewDidUnload];
}
    // --- Att Göra i denna controller: ----
    //Prepare for seque 
    //bakåt, där all info committas/savas !!!
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
