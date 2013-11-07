//
//  FDDeliverySummaryViewController.h
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

@class Delivery;

@interface FDDeliverySummaryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) Delivery *delivery;

@end
