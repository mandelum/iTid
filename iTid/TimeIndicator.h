//
//  TimeIndicator.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-29.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Timepoint.h"
#import "Activity.h"

@interface TimeIndicator : UIView
//@property (weak, nonatomic) Timepoint *timePoint;
@property (weak,nonatomic) Activity *activity;
@end
