//
//  TimelineViewController.h
//  iTid
//  Robin vill jobba med Timeline kodning
//  Created by Robin Brandt on 2012-02-02.

#import <UIKit/UIKit.h>
#import "TimelineScrollView.h"

@interface TimelineViewController : UIViewController

@property (weak, nonatomic) IBOutlet TimelineScrollView *TimelineScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *TimelineBackground;
@property (strong, nonatomic) NSTimer *sekundTimer;
@property (nonatomic) int dagsSekunder;

@end
