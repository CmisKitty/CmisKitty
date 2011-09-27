//
//  CKFolderViewController.m
//  CKBrowser
//
//  Created by Björn Jonsson on 2011-09-06.
//  Copyright 2011 CmisKitty
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "CKFolderViewController.h"



#import "CKObjectAttributesViewController.h"

@interface CKFolderViewController()

@property(nonatomic,retain) NSMutableArray * objects;

@end

@implementation CKFolderViewController

@synthesize folder =_folder;
@synthesize objects = _objects;
@synthesize fetchSize = _fetchSize;


-(NSMutableArray *)objects{
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    return _objects;
}

- (void)setup{
    
    _fetchSize = 20;
    _nextFetchSkipCount = 0;
    
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle{
    
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder{
    
    self = [super initWithCoder:decoder];
    if (self) {
        [self setup];
    }
    return self;
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(NSString *) resourcePath{
    
    NSString * resourcePath = self.folder.repository.rootFolderResourcePath;

    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:self.folder.objectId forKey:@"objectId"];
    if (self.fetchSize > 0) {
        [params setObject:[NSNumber numberWithInteger:self.fetchSize] forKey:@"maxItems"];
        [params setObject:[NSNumber numberWithInteger:_nextFetchSkipCount] forKey:@"skipCount"];
    }
    
    resourcePath = RKPathAppendQueryParams(resourcePath, params);
    return resourcePath;
}

- (void)loadObjects{
    
    CKAccountManager * manager = [CKAccountManager activeManager];
    RKObjectMapping * mapping = [manager.objectManager.mappingProvider objectMappingForClass:[CKFolderChildrenResponse class]];
    NSString * resourcePath = [self resourcePath];
    [manager.objectManager loadObjectsAtResourcePath:resourcePath objectMapping:mapping delegate:self];    
}
    
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = self.folder.name;
    
    // start load of objects
    [self loadObjects];
   
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
}

- (void)viewDidAppear:(BOOL)animated
{
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    // Configure the cell...
    
    
    CKObject * object = (CKObject *)[self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = object.name;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    CKObject * object = [self.objects objectAtIndex:indexPath.row];
    if ([object isKindOfClass:[CKFolder class]]) {
        
    }else if([object isKindOfClass:[CKDocument class]]){
        
    }
    
    
     CKFolderViewController *detailViewController = [[CKFolderViewController alloc] initWithNibName:@"CKFolderViewController" bundle:nil];
    detailViewController.folder = [self.objects objectAtIndex:indexPath.row];
    detailViewController.folder.repository = self.folder.repository;
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
   
    CKObjectAttributesViewController *detailViewController = [[CKObjectAttributesViewController alloc] initWithNibName:@"CKObjectAttributesViewController" bundle:nil];
    detailViewController.object = [self.objects objectAtIndex:indexPath.row];
    detailViewController.object.repository = self.folder.repository;
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError %@", error);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObject:(id)object{
    CKFolderChildrenResponse * response = (CKFolderChildrenResponse *)object;
    [self.objects addObjectsFromArray:response.objects];
    [self.tableView reloadData];
    
    // get more objects, if available
    if (response.hasMoreItems) {
        _nextFetchSkipCount = _nextFetchSkipCount + [response.objects count];
        [self loadObjects];
    }
     
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjectDictionary:(NSDictionary *)dictionary{
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects{
}

- (void)objectLoader:(RKObjectLoader *)loader willMapData:(inout id *)mappableData{
}

- (void)objectLoaderDidFinishLoading:(RKObjectLoader *)objectLoader{
}

- (void)objectLoaderDidLoadUnexpectedResponse:(RKObjectLoader *)objectLoader{
}


@end
