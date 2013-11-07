//
//  Delivery.h
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Driver, Order, TimeFrame;

@interface Delivery : NSManagedObject

@property (nonatomic, retain) Driver *driver;
@property (nonatomic, retain) NSOrderedSet *orders;
@property (nonatomic, retain) TimeFrame *timeFrame;

@property (nonatomic, readonly, strong) NSOrderedSet *stores;
@end

@interface Delivery (CoreDataGeneratedAccessors)

- (void)insertObject:(Order *)value inOrdersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromOrdersAtIndex:(NSUInteger)idx;
- (void)insertOrders:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeOrdersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInOrdersAtIndex:(NSUInteger)idx withObject:(Order *)value;
- (void)replaceOrdersAtIndexes:(NSIndexSet *)indexes withOrders:(NSArray *)values;
- (void)addOrdersObject:(Order *)value;
- (void)removeOrdersObject:(Order *)value;
- (void)addOrders:(NSOrderedSet *)values;
- (void)removeOrders:(NSOrderedSet *)values;
@end
