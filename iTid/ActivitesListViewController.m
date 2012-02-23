//
//  ActivitesListViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import "ActivitesListViewController.h"


@implementation ActivitesListViewController
@synthesize activityDataBase = _activityDataBase;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.activityDataBase) {  // for demo purposes, we'll create a default database if none is set
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Activity Database"];
        // url is now "<Documents Directory>/Default Photo Database"
        self.activityDataBase = [[UIManagedDocument alloc] initWithFileURL:url]; // setter will create this for us on disk
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


#pragma mark - Table view data source

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Activity Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    // Configure the cell...
//    
//    return cell;
//}
//


#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

#pragma mark - Prepare for Seque

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    //Activity *activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    //[segue.destinationViewController METHOD:ARGUMENT];
    ////[segue.destinationViewController performSelector:@selector(setPhotographer:) withObject:photographer];
}

@end
