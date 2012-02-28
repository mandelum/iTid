//
//  Icon.h
//  iTid
//
//  Created by Hyper Island on 2/28/12.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Image;

@interface Icon : NSManagedObject

@property (nonatomic, retain) NSSet *activity;
@property (nonatomic, retain) Image *image;
@end

@interface Icon (CoreDataGeneratedAccessors)

- (void)addActivityObject:(Activity *)value;
- (void)removeActivityObject:(Activity *)value;
- (void)addActivity:(NSSet *)values;
- (void)removeActivity:(NSSet *)values;

@end
