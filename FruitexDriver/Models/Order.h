//
//  Order.h
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Delivery;

@interface Order : NSManagedObject

@property (nonatomic, retain) Delivery *delivery;
@property (nonatomic, retain) NSSet *orderItems;
@end

@interface Order (CoreDataGeneratedAccessors)

- (void)addOrderItemsObject:(NSManagedObject *)value;
- (void)removeOrderItemsObject:(NSManagedObject *)value;
- (void)addOrderItems:(NSSet *)values;
- (void)removeOrderItems:(NSSet *)values;

@end
