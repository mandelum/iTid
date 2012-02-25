//
//  Step.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Image;

@interface Step : NSManagedObject

@property (nonatomic, retain) NSString * instruction;
@property (nonatomic, retain) Activity *inActivity;
@property (nonatomic, retain) Image *image;

@end
