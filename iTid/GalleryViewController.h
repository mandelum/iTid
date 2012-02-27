//
//  GalleryViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import <UIKit/UIKit.h>
#import "Icon.h"
#import "Image.h"

@class GalleryViewController;
@protocol GalleryViewControllerDelegate <NSObject>

- (void)selectedIcon:(Icon *)icon;

@end


@interface GalleryViewController : UIViewController
@property (weak, nonatomic) Icon *icon;
@property (weak, nonatomic) id <GalleryViewControllerDelegate> delegate;

@end
