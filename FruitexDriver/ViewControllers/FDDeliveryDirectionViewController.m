//
//  FDDeliveryDirectionViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/8/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDDeliveryDirectionViewController.h"
#import "FDDataManager.h"

@interface FDDeliveryDirectionViewController ()

@property (nonatomic, strong, readonly) CLLocationManager *locationManager;

@end

@implementation FDDeliveryDirectionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.title = @"Direction";

    __block NSInteger orderIndex = 0;

    [self.orders.rac_sequence.signal subscribeNext:^(Order *order) {
        NSInteger i = orderIndex++;
        [RACObserve(order, location) subscribeNext:^(CLLocation *location) {
            if (location == nil) return;
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
        [order updateLocation];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter & setter

@synthesize locationManager = _locationManager;
- (CLLocationManager *)locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.orders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderDirectionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    Order *order = [self.orders objectAtIndex:indexPath.row];
    cell.textLabel.text = order.address;
    if (order.location == nil) {
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityIndicatorView startAnimating];
        cell.accessoryView = activityIndicatorView;
        cell.detailTextLabel.text = order.address;
    } else if (self.locationManager.location == nil) {
        cell.accessoryView = nil;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.4f, %.4f | %@", order.location.coordinate.latitude, order.location.coordinate.longitude, order.address];
    } else {
        cell.accessoryView = nil;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2fm > %@", [order.location distanceFromLocation:self.locationManager.location], order.address];
    }
    
    return cell;
}

#pragma mark - Location manager delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.tableView reloadData];
}

@end
