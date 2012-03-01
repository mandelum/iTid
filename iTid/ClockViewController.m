//
//  ClockViewController.m
//  clock
//
//  Created by Enriquez Guillermo on 7/2/11.
//  Copyright 2011 Nacho4d. All rights reserved.
//  See the file License.txt for copying permission.
//

#import "ClockViewController.h"


@implementation ClockViewController

@synthesize theView;
@synthesize  clockView1;
@synthesize  clockView2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

-(void)loadView 
{
    [super loadView];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //ClockView with default style
	clockView1 = [[ClockView alloc] initWithFrame:CGRectMake(50, 250, 200, 200)];
	clockView1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.theView addSubview:clockView1];
    
    clockView2 = [[ClockView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
	clockView2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:clockView2];
   
}

- (void)viewWillAppear:(BOOL)animated
{
	//start the clock at current time
	[clockView1 start];
    clockView2.theDate = [NSDate date];
    [clockView2 updateClock:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
	//stop the clock

	//[clockView2 stop];
    [clockView1 stop];
}

- (void)viewDidUnload
{
    [self setTheView:nil];
	[super viewDidUnload];

	self.clockView1 = nil;
    self.clockView2 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
