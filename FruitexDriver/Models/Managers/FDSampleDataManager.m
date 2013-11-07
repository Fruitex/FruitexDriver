//
//  FDSampleDataManager.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDSampleDataManager.h"

@interface FDSampleDataManager ()

@end

@implementation FDSampleDataManager

- (id)initWithContext:(NSManagedObjectContext *)context
{
    self = [super initWithContext:context];
    if (self) {
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Driver"];
        NSArray *result = [self.context executeFetchRequest:request error:nil];
        if ([result count] == 0) {
            [self populateSampleData];
        }
    }
    return self;
}

- (void)populateSampleData
{
    // Add Driver
    Driver *driver = [NSEntityDescription insertNewObjectForEntityForName:@"Driver" inManagedObjectContext:self.context];
    driver.id = @1;
    driver.name = @"Greg";

    // Add TimeFrame
    TimeFrame *timeFrame = [NSEntityDescription insertNewObjectForEntityForName:@"TimeFrame" inManagedObjectContext:self.context];
    timeFrame.start = [NSDate date];
    timeFrame.end = [NSDate dateWithTimeInterval:7200 sinceDate:[NSDate date]];

    // Add Delivery
    Delivery *delivery = [NSEntityDescription insertNewObjectForEntityForName:@"Delivery" inManagedObjectContext:self.context];
    delivery.driver = driver;
    delivery.timeFrame = timeFrame;

    // Add Stores
    Store *sobeys = [NSEntityDescription insertNewObjectForEntityForName:@"Store" inManagedObjectContext:self.context];
    sobeys.name = @"Sobyes";
    sobeys.address = @"450 Columbia St W, Waterloo, ON N2T 2W1";

    Store *wlu = [NSEntityDescription insertNewObjectForEntityForName:@"Store" inManagedObjectContext:self.context];
    wlu.name = @"WLU Bookstore";
    wlu.address = @"75 University Ave. West, Waterloo, ON N2L 3C5";

    // Add Orders
    Order *orderA = [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:self.context];
    orderA.delivery = delivery;
    orderA.address = @"200 University Ave West, Waterloo";
    orderA.user = @"Greg";
    orderA.datePlaced = [NSDate dateWithTimeIntervalSinceNow:-36000];
    OrderItem *appleA = [NSEntityDescription insertNewObjectForEntityForName:@"OrderItem" inManagedObjectContext:self.context];
    appleA.name = @"Apple";
    appleA.quantity = @3;
    appleA.store = sobeys;
    appleA.order = orderA;
    OrderItem *bookA = [NSEntityDescription insertNewObjectForEntityForName:@"OrderItem" inManagedObjectContext:self.context];
    bookA.name = @"ECON Book";
    bookA.quantity = @1;
    bookA.store = wlu;
    bookA.order = orderA;

    Order *orderB = [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:self.context];
    orderB.delivery = delivery;
    orderB.address = @"200 Erb Str West, Waterloo";
    orderB.user = @"Rui";
    orderB.datePlaced = [NSDate dateWithTimeIntervalSinceNow:-46000];
    OrderItem *appleB = [NSEntityDescription insertNewObjectForEntityForName:@"OrderItem" inManagedObjectContext:self.context];
    appleB.name = @"Orange";
    appleB.quantity = @2;
    appleB.store = sobeys;
    appleB.order = orderB;
    OrderItem *bookB = [NSEntityDescription insertNewObjectForEntityForName:@"OrderItem" inManagedObjectContext:self.context];
    bookB.name = @"AFM Book";
    bookB.quantity = @1;
    bookB.store = wlu;
    bookB.order = orderB;

    NSError *error;
    if ([self.context save:&error]) {
        NSLog(@"Data Populated");
    } else {
        NSLog(@"Fail to save data: %@", error);
    }
}

@end
