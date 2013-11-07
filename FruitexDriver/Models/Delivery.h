//
//  Delivery.h
//  FruitexDriver
//
//  Created by Greg on 11/6/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Driver, Order, TimeFrame;

@interface Delivery : NSManagedObject

@property (nonatomic, retain) Driver *driver;
@property (nonatomic, retain) NSSet *orders;
@property (nonatomic, retain) TimeFrame *timeFrame;

@property (nonatomic, readonly, strong) NSSet *stores;
@end

@interface Delivery (CoreDataGeneratedAccessors)

- (void)addOrdersObject:(Order *)value;
- (void)removeOrdersObject:(Order *)value;
- (void)addOrders:(NSSet *)values;
- (void)removeOrders:(NSSet *)values;

@end
