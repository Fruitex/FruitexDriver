//
//  Store.h
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Store : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSSet *orderItems;
@end

@interface Store (CoreDataGeneratedAccessors)

- (void)addOrderItemsObject:(NSManagedObject *)value;
- (void)removeOrderItemsObject:(NSManagedObject *)value;
- (void)addOrderItems:(NSSet *)values;
- (void)removeOrderItems:(NSSet *)values;

@end
