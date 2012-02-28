//
//  Timepoint.h
//  iTid
//
//  Created by Hyper Island on 2/28/12.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Sound;

@interface Timepoint : NSManagedObject

@property (nonatomic, retain) NSNumber * alarm;
@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) Activity *endActivity;
@property (nonatomic, retain) Activity *preparationActivity;
@property (nonatomic, retain) Sound *sound;
@property (nonatomic, retain) Activity *startActivity;
@property (nonatomic, retain) Activity *tailActivity;

@end
