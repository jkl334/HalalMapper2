//
//  ViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController {
    GMSMapView *mapView_;
}

//@synthesize mapView;
@synthesize manager;
@synthesize currentLocation;
@synthesize touchMapCoordinate;

- (void)viewDidLoad {
    [super viewDidLoad];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7286689
                                                            longitude:-73.99566199999998
                                                                 zoom:7];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.7286689, -73.99566199999998);
    marker.title = @"You";
    marker.snippet = @"Hungry for Halal";
    marker.map = mapView_;
    /*
    [manager requestAlwaysAuthorization];
    [manager requestWhenInUseAuthorization];
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        [self.manager startUpdatingLocation];
        mapView.delegate = (id < MKMapViewDelegate >)self;
        mapView.showsUserLocation = YES;
        
    }
    //mapView.delegate = (id < MKMapViewDelegate >)self;
    //[self attachTapToMap];
    //[self initMap];
    //mapView.showsUserLocation = YES;
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*

-(void)initMap{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MKCoordinateRegion region;
    float spanX =  .04;
    float spanY = .04;
    region.center.latitude = appDelegate.currentLocation.coordinate.latitude;
    region.center.longitude = appDelegate.currentLocation.coordinate.longitude;
    region.span = MKCoordinateSpanMake(spanX, spanY);
    [self.mapView setRegion:region animated:YES];
}

-(void)attachTapToMap{
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [tgr setNumberOfTapsRequired:2];
    [tgr setDelegate:(id <UIGestureRecognizerDelegate>)self];
    [mapView addGestureRecognizer:tgr];
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    //Convert tap point to real life location on map
    CGPoint touchPoint = [gestureRecognizer locationInView:mapView];
    touchMapCoordinate = [mapView convertPoint:touchPoint toCoordinateFromView:mapView];
    NSLog(@"%f", touchMapCoordinate.latitude);
    //Prompt user
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"See Pictures Near That Location?"
                                                    message:@"Tap cancel to go back and choose a different location for PicturesNearMe."
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}
 */

@end
