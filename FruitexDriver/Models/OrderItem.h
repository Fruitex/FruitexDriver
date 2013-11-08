//
//  OrderItem.h
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Order, Store;

@interface OrderItem : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * purchased;
@property (nonatomic, retain) Order *order;
@property (nonatomic, retain) Store *store;

- (BOOL)updatePurchasedTo:(BOOL)purchased;

@end
