//
//  OrderItem.m
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "OrderItem.h"
#import "Order.h"
#import "Store.h"


@implementation OrderItem

@dynamic name;
@dynamic quantity;
@dynamic purchased;
@dynamic order;
@dynamic store;

- (BOOL)updatePurchasedTo:(BOOL)purchased
{
    NSNumber *wasPurchased = self.purchased;
    self.purchased = [NSNumber numberWithBool:purchased];
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Fail to update purchased state for %@, error: %@", self, error);

        self.purchased = wasPurchased;
        return NO;
    }
    return YES;
}

@end
