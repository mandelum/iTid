//
//  ColorPickerViewController.h
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import <UIKit/UIKit.h>
@class ColorPickerViewController;
@protocol ColorPickerViewControllerDelegate <NSObject>
-(void)thisColor:(UIColor *)color fromMe:(id)sender;
@end

@interface ColorPickerViewController : UIViewController
    //RSColorPicker
@property (strong,nonatomic) UIColor *color;
@property (weak,nonatomic) id <ColorPickerViewControllerDelegate> delegate;
@end
