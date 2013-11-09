//
//  FDMapViewController.h
//  FruitexDriver
//
//  Created by Greg on 11/9/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface FDMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, copy) NSOrderedSet *orders;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

- (IBAction)startTrackingUser:(id)sender;

@end
