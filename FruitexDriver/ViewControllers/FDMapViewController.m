//
//  FDMapViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/9/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDMapViewController.h"
#import "FDDataManager.h"

@interface FDMapViewController ()

@end

@implementation FDMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self.mapView addAnnotations:[self.orders array]];
    MKCoordinateRegion region = [FDMapViewController regionForAnnotations:self.orders];
    [self setRegion:region animated:NO];

    self.mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Map view delegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
//    MKCoordinateRegion region = [FDMapViewController regionForAnnotations:self.mapView.annotations];
//    [self setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    for (MKAnnotationView *view in views) {
        if ([view.annotation isKindOfClass:[Order class]]) {
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    Order *order = view.annotation;
    NSLog(@"Order: %@", order.location);
    MKPlacemark* place = [[MKPlacemark alloc] initWithCoordinate:order.location.coordinate addressDictionary: nil];
    MKMapItem* destination = [[MKMapItem alloc] initWithPlacemark: place];
    destination.name = order.user;
    [MKMapItem openMapsWithItems:@[destination] launchOptions:nil];
}

#pragma mark - Actions

- (IBAction)startTrackingUser:(id)sender
{
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

#pragma mark - Helpers

- (void)setRegion:(MKCoordinateRegion)region animated:(BOOL)animated
{
    region.span = MKCoordinateSpanMake(region.span.latitudeDelta + 0.01f, region.span.longitudeDelta + 0.01f);
    [self.mapView setRegion:region animated:animated];
}

+ (MKCoordinateRegion) regionForAnnotations:(id<NSFastEnumeration>) annotations
{
    double minLat=90.0f, maxLat=-90.0f;
    double minLon=180.0f, maxLon=-180.0f;

    for (id<MKAnnotation> mka in annotations) {
        if ( mka.coordinate.latitude  < minLat ) minLat = mka.coordinate.latitude;
        if ( mka.coordinate.latitude  > maxLat ) maxLat = mka.coordinate.latitude;
        if ( mka.coordinate.longitude < minLon ) minLon = mka.coordinate.longitude;
        if ( mka.coordinate.longitude > maxLon ) maxLon = mka.coordinate.longitude;
    }

    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((minLat+maxLat)/2.0, (minLon+maxLon)/2.0);
    MKCoordinateSpan span = MKCoordinateSpanMake(maxLat-minLat, maxLon-minLon);
    MKCoordinateRegion region = MKCoordinateRegionMake (center, span);

    return region;
}

@end
