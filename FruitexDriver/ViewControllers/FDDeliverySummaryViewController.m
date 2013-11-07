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
    SummaryViewStoreSection = 0,
    SummaryViewOrderSection,
    SummaryViewNumOfSections
} SummaryViewSections;

@interface FDDeliverySummaryViewController ()

@property (nonatomic, strong) FDDataManager *dataManager;

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
    self.dataManager = [FDSampleDataManager mainDataManager];
    Delivery *delivery = [self.dataManager deliveryForDriver:nil];
    NSLog(@"Delivery: %@", delivery);
    NSLog(@"Driver: %@", delivery.driver.name);
    NSLog(@"Start: %@ End: %@", delivery.timeFrame.start, delivery.timeFrame.end);
    NSLog(@"Stores: %@", delivery.stores);
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
//    if (section == SummaryViewOrderSection) {
//        return 2;
//    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
