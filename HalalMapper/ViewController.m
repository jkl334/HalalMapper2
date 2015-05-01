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
    
    //pushing placeholder data
    [dataManager saveData:@"1" name:@"W4th and Greene" latitude:@"40.729065" longitude:@"-73.995667" likes:@"20" dislikes:@"3" freepita:@"YES" drinkincluded:@"YES" greensauce:@"NO"];
    [dataManager saveData:@"2" name:@"W4th and Washington Sqr East" latitude:@"40.729224" longitude:@"-73.996010" likes:@"16" dislikes:@"11" freepita:@"NO" drinkincluded:@"NO" greensauce:@"YES"];
    [dataManager saveData:@"3" name:@"W Houston and Broadway" latitude:@"40.725374" longitude:@"-73.996959" likes:@"26" dislikes:@"14" freepita:@"NO" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"4" name:@"Broadway and Astor" latitude:@"40.729864" longitude:@"-73.992898" likes:@"2" dislikes:@"16" freepita:@"NO" drinkincluded:@"NO" greensauce:@"NO"];
    [dataManager saveData:@"5" name:@"Rafiqis E8th and Broadway" latitude:@"40.730693" longitude:@"-73.992190" likes:@"27" dislikes:@"13" freepita:@"YES" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"6" name:@"E14th and 3rd Ave" latitude:@"40.733265" longitude:@"-73.987513" likes:@"18" dislikes:@"15" freepita:@"NO" drinkincluded:@"YES" greensauce:@"NO"];
    [dataManager saveData:@"7" name:@"E14th and 4th Ave" latitude:@"40.734403" longitude:@"-73.989551" likes:@"12" dislikes:@"15" freepita:@"NO" drinkincluded:@"YES" greensauce:@"YES"];
    
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
