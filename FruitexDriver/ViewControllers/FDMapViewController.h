//
//  FDMapViewController.h
//  FruitexDriver
//
//  Created by Greg on 11/9/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

@class MKMapView;

@interface FDMapViewController : UIViewController

@property (nonatomic, copy) NSOrderedSet *orders;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end
