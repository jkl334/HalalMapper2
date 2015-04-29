//
//  ViewController.h
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate, GMSMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property CLLocation *currentLocation;
@property CLLocationManager *manager;
@property CLLocationCoordinate2D touchMapCoordinate;

@end

