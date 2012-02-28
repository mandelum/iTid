//
//  Step.h
//  iTid
//
//  Created by Hyper Island on 2/28/12.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Image;

@interface Step : NSManagedObject

@property (nonatomic, retain) NSString * instruction;
@property (nonatomic, retain) Image *image;
@property (nonatomic, retain) Activity *inActivity;

@end
