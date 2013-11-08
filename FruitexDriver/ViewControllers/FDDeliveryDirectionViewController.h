//
//  FDDeliveryDirectionViewController.h
//  FruitexDriver
//
//  Created by Greg on 11/8/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface FDDeliveryDirectionViewController : UITableViewController <CLLocationManagerDelegate>

@property (nonatomic, copy) NSOrderedSet *orders;

@end
