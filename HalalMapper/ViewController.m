//
//  ViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NSObject_DatabaseHelper.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController {
    GMSMapView *mapView_;
}

@synthesize manager;
@synthesize currentLocation;
@synthesize touchMapCoordinate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject_DatabaseHelper *dataManager = [[NSObject_DatabaseHelper alloc] init];
    
    [dataManager saveData:@"1" name:@"W4th and Greene" latitude:@"40.729065" longitude:@"-73.995667" likes:@"20" dislikes:@"3" freepita:@"YES" drinksincluded:@"YES" greensauce:@"NO"];
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7286689
                                                            longitude:-73.99566199999998
                                                                 zoom:15];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position   = CLLocationCoordinate2DMake(40.7286689, -73.99566199999998);
    marker.title      = @"You";
    marker.snippet    = @"Hungry for Halal";
    marker.map        = mapView_;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
