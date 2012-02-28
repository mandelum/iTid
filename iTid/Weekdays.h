//
//  Weekdays.h
//  iTid
//
//  Created by Hyper Island on 2/28/12.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Weekdays : NSManagedObject

@property (nonatomic, retain) NSString * weekday;
@property (nonatomic, retain) Activity *activity;

@end
