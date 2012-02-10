//
//  TimelineViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-02.

#import "TimelineViewController.h"

@implementation TimelineViewController

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

<<<<<<< HEAD
//*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView
//{
//}
=======

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
>>>>>>> d9516a4f2b2ecd453631aa216619eac29193d348



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(2000, 320)];
 
}


- (void)viewDidAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidUnload
{
    


    [self setImageView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
