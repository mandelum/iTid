//
//  Icon.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Image;

@interface Icon : NSManagedObject

@property (nonatomic, retain) Activity *activity;
@property (nonatomic, retain) Image *image;

@end
