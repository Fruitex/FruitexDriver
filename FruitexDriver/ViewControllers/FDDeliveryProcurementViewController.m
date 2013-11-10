//
//  FDDeliveryProcurementViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDDeliveryProcurementViewController.h"
#import "FDDeliveryPackingViewController.h"
#import "FDDataManager.h"

@interface FDDeliveryProcurementViewController ()

@end

@implementation FDDeliveryProcurementViewController

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

    self.title = @"Purchasing";
    [self purchasedOrderItemsDidChange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View update

- (void)purchasedOrderItemsDidChange
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.purchased == TRUE"];
    for (Store *store in self.delivery.stores) {
        NSOrderedSet *orderItems = [self.delivery orderItemsForStore:store];
        NSOrderedSet *purchasedOrderItems = [orderItems filteredOrderedSetUsingPredicate:predicate];
        NSLog(@"%@: %lu/%lu", store.name, (unsigned long)[purchasedOrderItems count], (unsigned long)[orderItems count]);
        if ([purchasedOrderItems count] < [orderItems count]) {
            self.nextStepButton.enabled = NO;
            return;
        }
    }
    self.nextStepButton.enabled = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.delivery.stores count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.delivery orderItemsForStore:[self.delivery.stores objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    OrderItem *orderItem = [[self.delivery orderItemsForStore:[self.delivery.stores objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    cell.textLabel.text = orderItem.name;
    cell.detailTextLabel.text = orderItem.quantity.description;
    cell.accessoryType = [orderItem.purchased boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return ((Store *)[self.delivery.stores objectAtIndex:section]).name;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL wasPurchased = [tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark;
    OrderItem *orderItem = [[self.delivery orderItemsForStore:[self.delivery.stores objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    [orderItem updatePurchasedTo:!wasPurchased];

    UITableViewCellAccessoryType accessoryType = [orderItem.purchased boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = accessoryType;
    [self purchasedOrderItemsDidChange];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[FDDeliveryPackingViewController class]]) {
        FDDeliveryPackingViewController *vc = segue.destinationViewController;
        vc.delivery = self.delivery;
    }
}

@end
