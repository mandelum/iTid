//
//  GalleryViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import "GalleryViewController.h"
#define IMAGEGAP 5

@implementation GalleryViewController
@synthesize icon = _icon;
@synthesize activity = _activity;
@synthesize delegate = _delegate;
@synthesize scrollView = _scrollView;
@synthesize iconArray = _iconArray;

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

-(IBAction)selectIcon:(UIButton *)sender 
{
    //UIImage *icon = [sender currentBackgroundImage];
    Icon *selIcon = [self.iconArray objectAtIndex:sender.tag];
    //NSLog(@"%d", [self.iconArray count]);
    self.icon = selIcon;
    [self.delegate selectedIcon:self.icon];
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImage *)resizingImagewithimagename:(UIImage *)inImage Length:(CGFloat)length
{
    UIGraphicsBeginImageContext(CGSizeMake(length,length));
    
    [inImage drawInRect: CGRectMake(0, 0, length, length)];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext(); 
    return smallImage;
}

-(UIButton *)getButtonRowSize:(int)_rowsize Count:(int)_count currentPos:(int)_pos withIcon:(Icon *)icon
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake(
                                (_pos%_rowsize)*((320-(_rowsize+1)*IMAGEGAP)   //x
                                /_rowsize)+(_pos%_rowsize +1)*IMAGEGAP,        
                                
                                (_pos/_rowsize)*((320-(_rowsize+1)*IMAGEGAP)   //y
                                /_rowsize)+(_pos/_rowsize +1)*IMAGEGAP,
                                
                                ((320-(_rowsize+1)*IMAGEGAP)/_rowsize),        //width
                                
                                ((320-(_rowsize+1)*IMAGEGAP)/_rowsize))];      //height
    
    //_pos index of a icon from database
    [button setBackgroundImage:[self resizingImagewithimagename:[UIImage imageNamed:icon.image.url] Length:((320-(_rowsize+1)*IMAGEGAP)/_rowsize)] forState:UIControlStateNormal];
    button.tag = _pos;
    [button addTarget:self action:@selector(selectIcon:) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    return button;
}


-(void)getButtonRowSize:(int)_rowsize Count:(int)_count iconArray:(NSArray *)array
{
    //[self.scrollView setFrame:CGRectMake(0, 0, 320, 480)];
    
    [self.scrollView setContentSize:CGSizeMake(320,((320-_rowsize*IMAGEGAP)/_rowsize)*(_count/_rowsize +1)+(_count/_rowsize)*IMAGEGAP)];
    for(int i=0;i<_count;i++)
        {
        [self.scrollView addSubview:[self getButtonRowSize:_rowsize Count:_count currentPos:i withIcon:[array objectAtIndex:i] ]];
         
        }
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //fetch and do inital load of images into database
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Icon" ];
    
    NSError *error = nil;
    self.iconArray = [self.activity.managedObjectContext executeFetchRequest:request error:&error];
    [self getButtonRowSize:3 Count:[self.iconArray count] iconArray:self.iconArray]; // ger correct count from database
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
