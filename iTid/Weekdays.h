//
//  Weekdays.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-23.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Weekdays : NSManagedObject

@property (nonatomic, retain) NSString * weekdays;
@property (nonatomic, retain) Activity *activity;

@end
