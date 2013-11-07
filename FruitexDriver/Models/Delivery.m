//
//  Delivery.m
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "Delivery.h"
#import "Driver.h"
#import "Order.h"
#import "TimeFrame.h"

#import "OrderItem.h"

@implementation Delivery

@dynamic driver;
@dynamic orders;
@dynamic timeFrame;

@synthesize stores = _stores;

- (NSOrderedSet *)stores
{
    if (_stores == nil) {
        NSMutableOrderedSet *stores = [NSMutableOrderedSet orderedSet];
        for (Order *order in self.orders) {
            for (OrderItem *orderItem in order.orderItems) {
                [stores addObject:orderItem.store];
            }
        }
        _stores = stores;
    }
    return _stores;
}

@end
