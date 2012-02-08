//
//  EditActivityViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-01-31.

#import "EditActivityViewController.h"

@implementation EditActivityViewController
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
    [super viewDidUnload];
}

@end
