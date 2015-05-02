//
//  AppDelegate.h
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import "DatabaseLoader.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate, GMSMapViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property CLLocation        *currentLocation;
@property CLLocationManager *locationManager;


@end

