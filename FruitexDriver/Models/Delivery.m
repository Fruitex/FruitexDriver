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
#import "Store.h"

@interface Delivery ()

@property (nonatomic, strong, readonly) NSDictionary *storeToOrderItems;

@end

@implementation Delivery

@dynamic driver;
@dynamic orders;
@dynamic timeFrame;

@synthesize stores = _stores;
@synthesize storeToOrderItems = _storeToOrderItems;

- (void)buildStoreAndOrderItemsData
{
    NSMutableOrderedSet *stores = [NSMutableOrderedSet orderedSet];
    NSMutableDictionary *storeToOrderItems = [NSMutableDictionary dictionary];
    for (Order *order in self.orders) {
        for (OrderItem *orderItem in order.orderItems) {
            [stores addObject:orderItem.store];
            NSMutableOrderedSet *orderItems = [storeToOrderItems objectForKey:orderItem.store.name];
            if (orderItems == nil) {
                orderItems = [NSMutableOrderedSet orderedSetWithObject:orderItem];
                [storeToOrderItems setObject:orderItems forKey:orderItem.store.name];
            } else {
                [orderItems addObject:orderItem];
            }
        }
    }
    _stores = stores;
    _storeToOrderItems = storeToOrderItems;
}

- (NSOrderedSet *)stores
{
    if (_stores == nil) {
        [self buildStoreAndOrderItemsData];
    }
    return _stores;
}

- (NSOrderedSet *)orderItemsForStore:(Store *)store
{
    if (_storeToOrderItems == nil) {
        [self buildStoreAndOrderItemsData];
    }
    return [self.storeToOrderItems objectForKey:store.name];
}

@end
