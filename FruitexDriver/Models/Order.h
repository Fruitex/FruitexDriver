//
//  Order.h
//  FruitexDriver
//
//  Created by Greg on 11/6/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Delivery, OrderItem;

@interface Order : NSManagedObject

@property (nonatomic, retain) Delivery *delivery;
@property (nonatomic, retain) NSSet *orderItems;
@end

@interface Order (CoreDataGeneratedAccessors)

- (void)addOrderItemsObject:(OrderItem *)value;
- (void)removeOrderItemsObject:(OrderItem *)value;
- (void)addOrderItems:(NSSet *)values;
- (void)removeOrderItems:(NSSet *)values;

@end
