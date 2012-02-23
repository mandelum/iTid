//
//  Activity.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-23.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sound, Weekdays;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Sound *sound;
@property (nonatomic, retain) Weekdays *weekdays;

@end
