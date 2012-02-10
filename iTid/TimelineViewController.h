//
//  TimelineViewController.h
//  iTid
//  Robin vill jobba med Timeline kodning
//  Created by Robin Brandt on 2012-02-02.

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController
{
    IBOutlet UIScrollView *scroller;

}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
