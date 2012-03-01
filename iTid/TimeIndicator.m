//
//  TimeIndicator.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-29.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import "TimeIndicator.h"
#import "Icon.h"
#import "Image.h"
#define gng 4
//#define pls

@implementation TimeIndicator
//@synthesize timePoint = _timePoint;
@synthesize activity = _activity;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 2
    [calendar setTimeZone:[NSTimeZone systemTimeZone]]; // 3
    
    NSDate *preparation = self.activity.preparation.time; // 1
    NSDateComponents *dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:preparation];  // 4
    int preparationSeconds = ([dc hour] * 60 + [dc minute])*gng;
    
    NSDate *start = self.activity.start.time; // 1
    dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:start];  // 4
    int startSeconds = ([dc hour] * 60 + [dc minute])*gng;
    
    NSDate *end = self.activity.end.time; // 1
    dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:end];  // 4
    int endSeconds = ([dc hour] * 60 + [dc minute])*gng;
    
    NSDate *tail = self.activity.tail.time; // 1
    dc = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:tail];  // 4
    int tailSeconds = ([dc hour] * 60 + [dc minute])*gng;
    
    
    
    
    UIImage *image = [UIImage imageNamed:self.activity.icon.image.url];
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(startSeconds-preparationSeconds, 110, 145, 145)];
    icon.image = image;
    icon.backgroundColor = self.activity.color;
    [self addSubview:icon];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(startSeconds-preparationSeconds, 253, 145, 40)];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = self.activity.color;
    label.textAlignment = UITextAlignmentCenter;
    label.text = [self.activity.name uppercaseString]; 
    label.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20.0];
    [self addSubview:label];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    timeFormat.timeStyle = NSDateFormatterShortStyle;
    timeFormat.dateStyle = NSDateFormatterNoStyle;
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(startSeconds-preparationSeconds, 70, 145, 40)];
    time.backgroundColor = [UIColor whiteColor];
    time.textColor = self.activity.color;
    time.textAlignment = UITextAlignmentCenter;
    time.text = [timeFormat stringFromDate:self.activity.start.time]; 
    time.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20.0];
    [self addSubview:time];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 320);
    CGContextAddLineToPoint(context, startSeconds-preparationSeconds, 300);
    CGContextAddLineToPoint(context, endSeconds-preparationSeconds, 300);
    CGContextAddLineToPoint(context, tailSeconds-preparationSeconds, 320);
    CGContextClosePath(context); // not strictly required
  	  
    [self.activity.color setFill]; 
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, startSeconds-preparationSeconds, 320);
    CGContextAddLineToPoint(context, startSeconds-preparationSeconds, 300);
    CGContextAddLineToPoint(context, startSeconds-preparationSeconds+20, 310);
    CGContextClosePath(context); // not strictly required
    [[UIColor whiteColor] setFill]; 
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, endSeconds-preparationSeconds, 320);
    CGContextAddLineToPoint(context, endSeconds-preparationSeconds, 300);
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
}


@end
