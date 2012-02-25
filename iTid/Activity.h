//
//  Activity.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Icon, Step, Timepoint, Weekdays;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id color;
@property (nonatomic, retain) NSSet *weekdays;
@property (nonatomic, retain) Icon *icon;
@property (nonatomic, retain) NSOrderedSet *stepSequence;
@property (nonatomic, retain) Timepoint *start;
@property (nonatomic, retain) Timepoint *preparation;
@property (nonatomic, retain) Timepoint *end;
@property (nonatomic, retain) Timepoint *tail;
@end

@interface Activity (CoreDataGeneratedAccessors)

- (void)addWeekdaysObject:(Weekdays *)value;
- (void)removeWeekdaysObject:(Weekdays *)value;
- (void)addWeekdays:(NSSet *)values;
- (void)removeWeekdays:(NSSet *)values;

- (void)insertObject:(Step *)value inStepSequenceAtIndex:(NSUInteger)idx;
- (void)removeObjectFromStepSequenceAtIndex:(NSUInteger)idx;
- (void)insertStepSequence:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeStepSequenceAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInStepSequenceAtIndex:(NSUInteger)idx withObject:(Step *)value;
- (void)replaceStepSequenceAtIndexes:(NSIndexSet *)indexes withStepSequence:(NSArray *)values;
- (void)addStepSequenceObject:(Step *)value;
- (void)removeStepSequenceObject:(Step *)value;
- (void)addStepSequence:(NSOrderedSet *)values;
- (void)removeStepSequence:(NSOrderedSet *)values;
@end
