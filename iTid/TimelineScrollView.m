//
//  TimelineScrollView.m
//  TeamToyProject01
//
//  Created by Robin Brandt on 2012-02-21.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import "TimelineScrollView.h"
#define gng 4
//#define pls
@implementation TimelineScrollView

-(id)initWithCoder:(NSCoder *)aDecoder 
{
    if ((self = [super initWithCoder:aDecoder]))
        {
        self.contentSize = CGSizeMake(1440*gng, 320);
        //self.contentSize = CGSizeMake(600, 320);
        
        }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
@end
