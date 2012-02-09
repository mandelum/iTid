//
//  EditActivityViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import "EditActivityViewController.h"

@implementation EditActivityViewController
@synthesize PreperationSwitch = _PreperationSwitch;
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
- (void)viewDidLoad {
    self.NameOfActivity.delegate = self;
}
- (void)viewDidUnload {
    [self setNameOfActivity:nil];
    [self setPreperationSwitch:nil];
    [self setEndSwitch:nil];
    [self setEndingTailSwitch:nil];
    [super viewDidUnload];
}

@end
