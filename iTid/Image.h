//
//  Image.h
//  iTid
//
//  Created by Hyper Island on 2/28/12.
//  Copyright (c) 2012 Hypno Abstract. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Background, Icon, Step;

@interface Image : NSManagedObject

@property (nonatomic, retain) id data;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Background *background;
@property (nonatomic, retain) NSSet *icon;
@property (nonatomic, retain) Step *step;
@end

@interface Image (CoreDataGeneratedAccessors)

- (void)addIconObject:(Icon *)value;
- (void)removeIconObject:(Icon *)value;
- (void)addIcon:(NSSet *)values;
- (void)removeIcon:(NSSet *)values;

@end
