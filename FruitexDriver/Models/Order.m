//
//  Order.m
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "Order.h"
#import "Delivery.h"
#import "OrderItem.h"

@interface Order ()

@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation Order

@dynamic datePlaced;
@dynamic user;
@dynamic address;
@dynamic delivery;
@dynamic orderItems;

@synthesize location;
@synthesize geocoder;

- (void)updateLocationWithCompletionHandler:(void (^)(Order *))completionHandler
{
    if (self.geocoder == nil) {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    if ([self.geocoder isGeocoding]) {
        return;
    }

    [self.geocoder geocodeAddressString:self.address completionHandler:^(NSArray *placemark, NSError *error) {
        if (error) {
            NSLog(@"Fail to geocode address %@", self.address);
            return;
        }

        switch ([placemark count]) {
            case 1:
                self.location = ((CLPlacemark *) [placemark firstObject]).location;
                NSLog(@"Placemark: %@", self.location);
                completionHandler(self);
                break;
            default:
                NSLog(@"More than one placemark found for address %@", self.address);
                break;
        }
    }];
}

@end
