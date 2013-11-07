//
//  Driver.h
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Delivery;

@interface Driver : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *deliveries;
@end

@interface Driver (CoreDataGeneratedAccessors)

- (void)insertObject:(Delivery *)value inDeliveriesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDeliveriesAtIndex:(NSUInteger)idx;
- (void)insertDeliveries:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDeliveriesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDeliveriesAtIndex:(NSUInteger)idx withObject:(Delivery *)value;
- (void)replaceDeliveriesAtIndexes:(NSIndexSet *)indexes withDeliveries:(NSArray *)values;
- (void)addDeliveriesObject:(Delivery *)value;
- (void)removeDeliveriesObject:(Delivery *)value;
- (void)addDeliveries:(NSOrderedSet *)values;
- (void)removeDeliveries:(NSOrderedSet *)values;
@end
