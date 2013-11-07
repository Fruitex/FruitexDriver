//
//  FDDataManager.m
//  FruitexDriver
//
//  Created by Greg on 11/6/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDDataManager.h"

@implementation FDDataManager

+ (instancetype)mainDataManager
{
    FDDataManager *manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            NSManagedObjectContext *context =  (NSManagedObjectContext *) [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
            manager = [[self alloc] initWithContext:context];
        }
    }
    return manager;
}

- (id)initWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self) {
        self.context = context;
        NSAssert(self.context != nil, @"Managed Object Context cannot be nil");
    }
    return self;
}

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

#pragma mark - Data accessing

- (Delivery *)deliveryForDriver:(Driver *)driver
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Delivery"];
    NSArray *result = [self.context executeFetchRequest:request error:nil];

    NSAssert([result count] > 0, @"Must exists a delivery in sample data. ");
    return [result objectAtIndex:0];
}

@end
