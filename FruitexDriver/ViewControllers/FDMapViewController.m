//
//  FDMapViewController.m
//  FruitexDriver
//
//  Created by Greg on 11/9/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDMapViewController.h"
#import <MapKit/MapKit.h>

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
