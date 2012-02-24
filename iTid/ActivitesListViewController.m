//
//  ActivitesListViewController.m
//  iTid
//
//  Created by Robin Brandt on 2012-02-08.

#import "ActivitesListViewController.h"
#import "Activity.h"
#import "EditActivityViewController.h"

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

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Activity"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    // Lägg till sort by date
    // no predicate because we want ALL the Activites
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.activityDataBase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

-(void)fillDatabaseWithDummyStuff:(UIManagedDocument *)document
{
    [self.activityDataBase.managedObjectContext performBlock:^{
        
        Activity *dummyActivity = [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:self.activityDataBase.managedObjectContext];
        dummyActivity.name = @"lol";
        NSLog(@"hej lol");
        
        
    [self.activityDataBase saveToURL:self.activityDataBase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
    
    }];
     
}



- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.activityDataBase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.activityDataBase saveToURL:self.activityDataBase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
            [self fillDatabaseWithDummyStuff:self.activityDataBase];
        }];
    } else if (self.activityDataBase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.activityDataBase openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.activityDataBase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
        [self setupFetchedResultsController];
    }
}

- (void)setActivityDataBase:(UIManagedDocument *)activityDataBase
{
    if (_activityDataBase != activityDataBase) {
        _activityDataBase = activityDataBase;
        [self useDocument];
    }
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Activity Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Activity *activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = activity.name;
    //Fixa bild
    //Fixa tid(NSDate)
    return cell;
}



#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

#pragma mark - Prepare for Seque

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    
    
    
    
    UIViewController *editView =  segue.destinationViewController;
    if ([editView respondsToSelector:@selector(setActivity:)]) {
    Activity *activity = nil;
    if ([segue.identifier isEqualToString:@"Edit Chosen Activity"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
        //UINavigationController *navView = segue.destinationViewController;
        //EditActivityViewController *editView = (EditActivityViewController *)navView.topViewController;
        //EditActivityViewController *editView = [navView.viewControllers objectAtIndex:0];
        //NSLog(@"%@", editView);
        
        
        editView.title = activity.name;
    
        
        
        //NSLog(@"joo");
        //NSLog(@"%@", editView.nameOfActivity.text);
//        if ([editView respondsToSelector:@selector(setNameOfActivity)]) {
//            NSLog(@"jee");
//            [editView performSelector:@selector(setNameOfActivity) withObject:activity.name];
//        }

        
             //playerDetailsViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"Add New Activity"]) {
        editView.title = @"Ny Aktivitet";
        activity = [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:self.activityDataBase.managedObjectContext];
        
    }
    [editView performSelector:@selector(setActivity:) withObject:activity];
    ////[segue.destinationViewController performSelector:@selector(setPhotographer:) withObject:photographer];
    }
}

@end
