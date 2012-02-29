//
//  TimelineViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-02.

#import "TimelineViewController.h"

@implementation TimelineViewController
@synthesize TimelineScrollView = _TimelineScrollView;
@synthesize TimelineBackground = _TimelineBackground;
@synthesize sekundTimer = _sekundTimer;
@synthesize dagsSekunder = _dagsSekunder;
@synthesize activityDataBase = _activityDataBase;

-(void)setupFetch

{
    
}

- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.activityDataBase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.activityDataBase saveToURL:self.activityDataBase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetch];
            //[self fillDatabaseWithDummyStuff:self.activityDataBase];
        }];
    } else if (self.activityDataBase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.activityDataBase openWithCompletionHandler:^(BOOL success) {
            [self setupFetch];
        }];
    } else if (self.activityDataBase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
        [self setupFetch];
    }
}

- (void)setActivityDataBase:(UIManagedDocument *)activityDataBase
{
    if (_activityDataBase != activityDataBase) {
        _activityDataBase = activityDataBase;
        [self useDocument];
    }
}

-(void)updateTimeSync
{
    NSDate *now = [NSDate date]; // 1
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 2
    [calendar setTimeZone:[NSTimeZone systemTimeZone]]; // 3
    NSDateComponents *dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|
                                                 NSSecondCalendarUnit) fromDate:now];  // 4
    
    
    self.dagsSekunder = [dc hour] * 60 * 60 + [dc minute] * 60 + [dc second];
    
    [self.TimelineScrollView setContentOffset:CGPointMake(self.dagsSekunder, 0) animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

//*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView
//{
//}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.TimelineScrollView setScrollEnabled:YES];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Activity" ];
    
    NSError *error = nil;
    self.activities = [self.activityDataBase.managedObjectContext executeFetchRequest:request error:&error];
 
}


- (void)viewDidAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.sekundTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self 
                                                      selector:@selector(updateTimeSync) 
                                                      userInfo:nil 
                                                       repeats:YES];

}

- (void)viewDidUnload
{    
    [self setTimelineScrollView:nil];
    [self setTimelineBackground:nil];
    [super viewDidUnload];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
	[super viewWillDisappear:animated];
    [self.sekundTimer invalidate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
