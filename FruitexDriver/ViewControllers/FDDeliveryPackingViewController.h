//
//  FDDeliveryPackingViewController.h
//  FruitexDriver
//
//  Created by Greg on 11/7/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

@class Delivery;

@interface FDDeliveryPackingViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UIBarButtonItem *nextStepButton;
@property (nonatomic, strong) Delivery *delivery;

@end
