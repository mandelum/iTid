//
//  TimelineViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-02.

#import "TimelineViewController.h"

@implementation TimelineViewController
@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad{
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(1000, 320)];
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidUnload
{
    


    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
