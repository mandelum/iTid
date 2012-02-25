//
//  Settings.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Background, Typeface;

@interface Settings : NSManagedObject

@property (nonatomic, retain) NSNumber * analogWatch;
@property (nonatomic, retain) NSNumber * digitalWatch;
@property (nonatomic, retain) NSNumber * textEnabled;
@property (nonatomic, retain) Background *background;
@property (nonatomic, retain) Typeface *typeface;

@end
