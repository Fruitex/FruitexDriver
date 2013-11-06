//
//  Delivery.h
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Delivery : NSManagedObject

@property (nonatomic, retain) NSManagedObject *driver;
@property (nonatomic, retain) NSManagedObject *timeFrame;
@property (nonatomic, retain) NSSet *orders;
@end

@interface Delivery (CoreDataGeneratedAccessors)

- (void)addOrdersObject:(NSManagedObject *)value;
- (void)removeOrdersObject:(NSManagedObject *)value;
- (void)addOrders:(NSSet *)values;
- (void)removeOrders:(NSSet *)values;

@end
