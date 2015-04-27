//
//  AppDelegate.h
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    CLLocationManager  *locationManager;
    IBOutlet MKMapView *mapView;

}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end

