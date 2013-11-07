//
//  FDDataManager.h
//  FruitexDriver
//
//  Created by Greg on 11/6/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "Driver.h"
#import "Delivery.h"
#import "TimeFrame.h"
#import "Order.h"
#import "OrderItem.h"
#import "Store.h"

@interface FDDataManager : NSObject

@property (nonatomic, weak) NSManagedObjectContext *context;

+ (instancetype)mainDataManager;
- (id)initWithContext:(NSManagedObjectContext *)context;

- (Delivery *)deliveryForDriver:(Driver *)driver;

@end
