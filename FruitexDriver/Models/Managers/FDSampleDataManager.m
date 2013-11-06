//
//  FDSampleDataManager.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDSampleDataManager.h"

@interface FDSampleDataManager ()

@property (nonatomic, weak) NSManagedObjectContext *context;

@end

@implementation FDSampleDataManager

+ (FDSampleDataManager *)mainSampleDataManager
{
    FDSampleDataManager *manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            NSManagedObjectContext *context =  (NSManagedObjectContext *) [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
            manager = [[self alloc] initWithContext:context];
        }
    }
    return manager;
}

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)initWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self) {
        self.context = context;
        NSAssert(self.context != nil, @"Managed Object Context cannot be nil");

        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Driver"];
        NSArray *result = [self.context executeFetchRequest:request error:nil];
        if ([result count] == 0) {
            [self populateSampleData];
        }
    }
    return self;
}

- (void)populateSampleData
{
    NSLog(@"Populating Data");
}

@end
