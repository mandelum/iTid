//
//  CurrentTimeIndicator.m
//  iTid
//
//  Created by Robin Brandt on 2012-03-01.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import "CurrentTimeIndicator.h"



@implementation CurrentTimeIndicator
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
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 320);
    CGContextAddLineToPoint(context, 0, 0);
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(context, 5.0);
    CGContextDrawPath(context, kCGPathStroke);
    
}


@end
