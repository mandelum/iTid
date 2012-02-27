//
//  GalleryViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import "GalleryViewController.h"
#define IMAGEGAP 5

@implementation GalleryViewController
@synthesize icon = _icon;
@synthesize delegate = _delegate;
@synthesize scrollView = _scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(IBAction)selectIcon:(id)sender 
{
    NSLog(@"%@",sender);
}

- (UIImage *)resizingImagewithimagename:(UIImage *)inImage Length:(CGFloat)length
{
    UIGraphicsBeginImageContext(CGSizeMake(length,length));
    
    [inImage drawInRect: CGRectMake(0, 0, length, length)];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext(); 
    return smallImage;
}

-(UIButton *)getButtonRowSize:(int)_rowsize Count:(int)_count currentPos:(int)_pos
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake((_pos%_rowsize)*((320-(_rowsize+1)*IMAGEGAP)/_rowsize)+(_pos%_rowsize +1)*IMAGEGAP,(_pos/_rowsize)*((320-(_rowsize+1)*IMAGEGAP)/_rowsize)+(_pos/_rowsize +1)*IMAGEGAP,((320-(_rowsize+1)*IMAGEGAP)/_rowsize),((320-(_rowsize+1)*IMAGEGAP)/_rowsize))];
    
    //_pos index of a icon from database
    [button setBackgroundImage:[self resizingImagewithimagename:[UIImage imageNamed:@"aktiviteter.png"] Length:((320-(_rowsize+1)*IMAGEGAP)/_rowsize)] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectIcon:) forControlEvents:UIControlEventTouchUpInside];

    
    return button;
}


-(void)getButtonRowSize:(int)_rowsize Count:(int)_count
{
    //[self.scrollView setFrame:CGRectMake(0, 0, 320, 480)];
    
    [self.scrollView setContentSize:CGSizeMake(320,((320-_rowsize*IMAGEGAP)/_rowsize)*(_count/_rowsize +1)+(_count/_rowsize)*IMAGEGAP)];
    for(int i=0;i<_count;i++)
        {
        [self.scrollView addSubview:[self getButtonRowSize:_rowsize Count:_count currentPos:i]];
        }
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //fetch and do inital load of images into database
    [self getButtonRowSize:3 Count:40]; // ger correct count from database
}


- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"iconGallery"]) {
        [self.delegate selectedIcon:self.icon];
    }
}

@end
