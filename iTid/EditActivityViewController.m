//
//  EditActivityViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import "EditActivityViewController.h"
#import "Icon.h"
#import "Image.h"
#import "Activity.h"
#import "TimePickerViewController.h"
@interface EditActivityViewController()

@end

@implementation EditActivityViewController

@synthesize preparationSwitch = _preperationSwitch;
@synthesize preparationTimeAndAlarm = _preparationTimeAndAlarm;
@synthesize startTimeAndAlarm = _startTimeAndAlarm;
@synthesize endSwitch = _endSwitch;
@synthesize endTimeAndAlarm = _endTimeAndAlarm;
@synthesize tailSwitch = _tailSwitch;
@synthesize tailTimeAndAlarm = _tailTimeAndAlarm;
@synthesize nameOfActivity = _nameOfActivity;
@synthesize activity = _activity;
@synthesize delegate = _delegate;
@synthesize iconView = _iconView;

-(void)thisTime:(Timepoint *)timePoint with:(NSString *)type fromMe:(id)sender
{
    
    if([type isEqualToString:@"preparation"])
        {
            self.activity.preparation = timePoint;
        
        }
    
}

- (void)selectedIcon:(Icon *)icon {
    //self.tempActivity.icon = icon;
    //self.iconView.image = [UIImage imageNamed:self.tempActivity.icon.image.url];
    self.activity.icon = icon;
    self.iconView.image = [UIImage imageNamed:self.activity.icon.image.url];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		[self.navigationController popViewControllerAnimated:YES];
        [self.activity.managedObjectContext deleteObject:self.activity];
        [self.delegate saveFrom:self withActivity:self.activity];
	} else if (buttonIndex == 1) {
	} 		
}

- (IBAction)delete:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Ta bort den här aktiviteten?" delegate:self cancelButtonTitle:@"Tillbaka" destructiveButtonTitle:@"Ta bort!" otherButtonTitles: nil];
	popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	[popupQuery showInView:self.view];

    
}
/*
- (IBAction)save:(id)sender {
    
        
    if ([self.title isEqualToString:@"Ny Aktivitet"])
        {
        NSLog(@"innuti ny aktivitet insertion");
        
        }
    //self.activity = [self.tempActivity copy];
    self.activity.name = self.nameOfActivity.text;
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
}*/
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tempActivity = [self.activity copy];
    self.nameOfActivity.delegate = self;
    self.nameOfActivity.text = self.activity.name;
        //self.iconView.image = [UIImage imageNamed:self.activity.icon.image.url];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.iconView.image = [UIImage imageNamed:self.activity.icon.image.url];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    timeFormat.timeStyle = NSDateFormatterShortStyle;
    timeFormat.dateStyle = NSDateFormatterNoStyle;
    NSString *alarmOn = nil;
    NSLog(@"%@", self.activity.preparation.alarm);
    if([self.activity.preparation.alarm boolValue])
        {
        alarmOn = @" Larm";
        }
    else {
        alarmOn = @" ";
    }
        
    self.preparationTimeAndAlarm.text = [[timeFormat stringFromDate:self.activity.preparation.time] stringByAppendingString:alarmOn];
    

    if ([self.title isEqualToString:@"Ny Aktivitet"] && !self.nameOfActivity.text)
        {
        [self.nameOfActivity becomeFirstResponder];
        
        }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.activity.name = self.nameOfActivity.text;
    [self.delegate saveFrom:self withActivity:self.activity];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //[self.delegate saveFrom:self withActivity:self.activity];
    [super viewDidDisappear:animated];
}
-(void)viewWillUnload {
    
    [super viewWillUnload];
}

- (void)viewDidUnload {
    
    [self setNameOfActivity:nil];
    [self setPreparationSwitch:nil];
    [self setEndSwitch:nil];
    [self setTailSwitch:nil];
    [self setIconView:nil];
    [self setPreparationTimeAndAlarm:nil];
    [self setStartTimeAndAlarm:nil];
    [self setEndTimeAndAlarm:nil];
    [self setTailTimeAndAlarm:nil];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"iconGallery"]) {
        GalleryViewController *galleryViewController = segue.destinationViewController;
        galleryViewController.delegate = self;
        galleryViewController.icon = self.activity.icon;
        galleryViewController.activity = self.activity;
    }
    
    else if([segue.identifier isEqualToString:@"preparation"]){
        TimePickerViewController *TPVC = segue.destinationViewController;
        TPVC.timePoint = self.activity.preparation;
        TPVC.type = @"preparation";
        TPVC.delegate = self;
        TPVC.activity = self.activity;
        
        
    }
    
    
}
    

@end
