//
//  Typeface.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-25.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Settings;

@interface Typeface : NSManagedObject

@property (nonatomic, retain) Settings *settings;

@end
