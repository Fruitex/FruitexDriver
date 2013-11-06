//
//  Driver.h
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Delivery;

@interface Driver : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *deliveries;
@end

@interface Driver (CoreDataGeneratedAccessors)

- (void)addDeliveriesObject:(Delivery *)value;
- (void)removeDeliveriesObject:(Delivery *)value;
- (void)addDeliveries:(NSSet *)values;
- (void)removeDeliveries:(NSSet *)values;

@end
