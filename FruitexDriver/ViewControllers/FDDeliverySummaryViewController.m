//
//  FDDeliverySummaryViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDDeliverySummaryViewController.h"
#import "FDDeliveryProcurementViewController.h"
#import "FDSampleDataManager.h"

typedef enum {
    SummaryViewDeliverySection,
    SummaryViewStoreSection,
    SummaryViewOrderSection,
    SummaryViewActionSection,
    SummaryViewNumOfSections
} SummaryViewSections;

@interface FDDeliverySummaryViewController ()

@end

@implementation FDDeliverySummaryViewController

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
    if (section == SummaryViewDeliverySection) {
        return 2;
    }
    if (section == SummaryViewStoreSection) {
        return [self.delivery.stores count];
    }
    if (section == SummaryViewOrderSection) {
        return [self.delivery.orders count];
    }
    if (section == SummaryViewActionSection) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == SummaryViewDeliverySection) {
        static NSString *cellIdentifier = @"summaryCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

        cell.textLabel.text = indexPath.row == 0 ? @"Driver" : @"Time Frame";
        cell.detailTextLabel.text = indexPath.row == 0 ? self.delivery.driver.name : [NSString stringWithFormat:@"%@ ~ %@", self.delivery.timeFrame.start, self
                                                                                .delivery.timeFrame.end];
    }
    if (indexPath.section == SummaryViewStoreSection) {
        static NSString *cellIdentifier = @"storeCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

        Store *store = [self.delivery.stores objectAtIndex:indexPath.row];
        cell.textLabel.text = store.name;
        cell.detailTextLabel.text = store.address;
    }
    if (indexPath.section == SummaryViewOrderSection) {
        static NSString *cellIdentifier = @"orderCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

        Order *order = [self.delivery.orders objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ @ %@", order.user, order.datePlaced];
        cell.detailTextLabel.text = order.address;
    }
    if (indexPath.section == SummaryViewActionSection) {
        static NSString *cellIdentifier = @"startCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = @"Start Deliver";
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[FDDeliveryProcurementViewController class]]) {
        FDDeliveryProcurementViewController *vc = segue.destinationViewController;
        vc.delivery = self.delivery;
    }
}

@end
