//
//  Sound.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Timepoint;

@interface Sound : NSManagedObject

@property (nonatomic, retain) NSString * sounddataurl;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Timepoint *timepoint;

@end
