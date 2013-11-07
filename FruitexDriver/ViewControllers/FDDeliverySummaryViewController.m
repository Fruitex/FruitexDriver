//
//  FDDeliverySummaryViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDDeliverySummaryViewController.h"
#import "FDSampleDataManager.h"

typedef enum {
    SummaryViewStoreSection,
    SummaryViewOrderSection,
    SummaryViewNumOfSections
} SummaryViewSections;

@interface FDDeliverySummaryViewController ()

@end

@implementation FDDeliverySummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Delivery";

    // Prepare delivery data
    FDDataManager *dataManager = [FDSampleDataManager mainDataManager];
    Delivery *delivery = [dataManager deliveryForDriver:nil];
    NSLog(@"Delivery: %@", delivery);
    NSLog(@"Driver: %@", delivery.driver.name);
    NSLog(@"Start: %@ End: %@", delivery.timeFrame.start, delivery.timeFrame.end);
    NSLog(@"Stores: %@", delivery.stores);
    self.delivery = delivery;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return SummaryViewNumOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == SummaryViewStoreSection) {
        return [self.delivery.stores count];
    }
    if (section == SummaryViewOrderSection) {
        return [self.delivery.orders count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == SummaryViewStoreSection) {
        static NSString *cellIdentifier = @"storeCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }

        Store *store = [self.delivery.stores objectAtIndex:indexPath.row];
        cell.textLabel.text = store.name;
        cell.detailTextLabel.text = store.address;
    }
    if (indexPath.section == SummaryViewOrderSection) {
        static NSString *cellIdentifier = @"orderCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }

        Order *order = [self.delivery.orders objectAtIndex:indexPath.row];
        cell.textLabel.text = order.datePlaced.description;
        cell.detailTextLabel.text = order.address;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == SummaryViewStoreSection) {
        return @"Stores";
    }
    if (section == SummaryViewOrderSection) {
        return @"Orders";
    }
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
