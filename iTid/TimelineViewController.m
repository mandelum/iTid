//
//  TimelineViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-02.

#import "TimelineViewController.h"

#define gng 4
//#define pls


@implementation TimelineViewController

@synthesize TimelineScrollView = _TimelineScrollView;
@synthesize TimelineBackground = _TimelineBackground;
@synthesize sekundTimer = _sekundTimer;
@synthesize dagsSekunder = _dagsSekunder;
@synthesize activityDataBase = _activityDataBase;
@synthesize activities = _activities;
@synthesize currentTime = _currentTime;
@synthesize clockView1 = _clockView1;


-(void)setupFetch

{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Activity" ];
    NSLog(@"setupFetch");

    NSError *error = nil;
    self.activities = [self.activityDataBase.managedObjectContext executeFetchRequest:request error:&error];
}

- (void)useDocument
{
    NSLog(@"useDocument");

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
    NSLog(@"setactivitiesdatabase");

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
    
    
    self.dagsSekunder = ([dc hour] * 60 + [dc minute])*gng;
    
    //if(self.currentTime)self.currentTime.frame = CGRectMake(self.dagsSekunder, 0, 100, 320);
    if(self.currentTime)self.currentTime.frame = CGRectMake(self.dagsSekunder, 0, 100, 320);
    if(self.clockView1)self.clockView1.frame = CGRectMake(self.dagsSekunder-50, 0, 100, 100);


    //[self.TimelineScrollView setContentOffset:CGPointMake(self.dagsSekunder, 0) animated:YES];
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
    NSLog(@"viewdidload");
    
    

    if (!self.activityDataBase) {  // for demo purposes, we'll create a default database if none is set
        NSLog(@"ifself...");

        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Activity Database"];
        // url is now "<Documents Directory>/Default Photo Database"
        self.activityDataBase = [[UIManagedDocument alloc] initWithFileURL:url]; // setter will create this for us on disk
    }
    
    
    
    //[self.TimelineScrollView setScrollEnabled:YES];
    
 
}

 
- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];


    for (Activity *activity in self.activities){
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 2
        [calendar setTimeZone:[NSTimeZone systemTimeZone]]; // 3
        
        NSDate *preparation = activity.preparation.time; // 1
        NSDateComponents *dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:preparation];  // 4
        int preparationSeconds = ([dc hour] * 60 + [dc minute])*gng;
        
        NSDate *start = activity.start.time; // 1
        dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:start];  // 4
        int startSeconds = ([dc hour] * 60 + [dc minute])*gng;
        
        NSDate *end = activity.end.time; // 1
        dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:end];  // 4
        int endSeconds = ([dc hour] * 60 + [dc minute])*gng;
        
        NSDate *tail = activity.tail.time; // 1
        dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:tail];  // 4
        int tailSeconds = ([dc hour] * 60 + [dc minute])*gng;
        
        TimeIndicator *timeInd = [[TimeIndicator alloc]initWithFrame:CGRectMake(preparationSeconds, 0, tailSeconds-preparationSeconds, 320)];
        timeInd.backgroundColor = [UIColor clearColor];
        timeInd.activity = activity;
        [self.TimelineScrollView addSubview:timeInd];    
        
        ClockView *smallClock = [[ClockView alloc]initWithFrame:CGRectMake(startSeconds+10, 0, 70, 70)];
        smallClock.backgroundColor = [UIColor clearColor];
        [self.TimelineScrollView addSubview:smallClock];
        smallClock.theDate = activity.start.time;
        [smallClock updateClock:nil];
                                 
        
        NSLog(@"%@", activity.name);
        
    }
    [self updateTimeSync];
    
    self.currentTime = [[CurrentTimeIndicator alloc] initWithFrame:CGRectMake(self.dagsSekunder, 0, 100, 320)];
    self.currentTime.backgroundColor = [UIColor clearColor];
    [self.TimelineScrollView addSubview:self.currentTime];    
   
    self.clockView1 = [[ClockView alloc] initWithFrame:CGRectMake(self.dagsSekunder-50, 0, 100, 100)];
	self.clockView1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.clockView1.backgroundColor = [UIColor whiteColor];

    [self.TimelineScrollView addSubview:self.clockView1];
    [self.clockView1 start];

    
    /*
    for (int i=1; i<self.TimelineScrollView.contentSize.width
; i +=30) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i, 100, 50, 100)];
        label.backgroundColor = [UIColor darkGrayColor];
        label.textColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%i",i];
        [self.TimelineScrollView addSubview:label];
    }
    */
     self.sekundTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self 
                                                      selector:@selector(updateTimeSync) 
                                                      userInfo:nil 
                                                       repeats:YES];
    [self.TimelineScrollView setContentOffset:CGPointMake(self.dagsSekunder-100, 0) animated:YES];

     

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
    [self.clockView1 stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations

    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
