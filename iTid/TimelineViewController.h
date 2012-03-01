//
//  TimelineViewController.h
//  iTid
//  Robin vill jobba med Timeline kodning
//  Created by Robin Brandt on 2012-02-02.

#import <UIKit/UIKit.h>
#import "TimelineScrollView.h"
#import "Icon.h"
#import "Image.h"
#import "Activity.h"
#import "TimeIndicator.h"
#import "CurrentTimeIndicator.h"
#import "ClockView.h"


@interface TimelineViewController : UIViewController {
}

@property (weak, nonatomic) IBOutlet TimelineScrollView *TimelineScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *TimelineBackground;
@property (strong, nonatomic) NSTimer *sekundTimer;
@property (nonatomic) int dagsSekunder;
@property (nonatomic, strong) UIManagedDocument *activityDataBase;
@property (strong, nonatomic) NSArray *activities;
@property (strong,nonatomic) CurrentTimeIndicator *currentTime;
@property (nonatomic, strong) ClockView *clockView1;

@end
