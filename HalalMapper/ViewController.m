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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSObject_DatabaseHelper *cartsData = [NSObject_DatabaseHelper getSharedInstance];
    [cartsData saveData:@"1"
                   name:@"W4th and Greene"
               latitude:@"40.729065"
              longitude:@"-73.995667"
                  likes:@"20"
               dislikes:@"3"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"NO" ];
    
    [cartsData saveData:@"3"
                   name:@"W Houston and Broadway"
               latitude:@"40.725374"
              longitude:@"-73.996959"
                  likes:@"26"
               dislikes:@"14"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"4"
                   name:@"Broadway and Astor"
               latitude:@"40.729864"
              longitude:@"-73.992898"
                  likes:@"2"
               dislikes:@"16"
               freepita:@"NO"
          drinkincluded:@"NO"
             greensauce:@"NO"];
    
    [cartsData saveData:@"5"
                   name:@"Rafiqis E8th and Broadway"
               latitude:@"40.730693"
              longitude:@"-73.992190"
                  likes:@"27"
               dislikes:@"13"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"6"
                   name:@"E14th and 3rd Ave"
               latitude:@"40.733265"
              longitude:@"-73.987513"
                  likes:@"18"
               dislikes:@"15"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"NO"];
    
    [cartsData saveData:@"7"
                   name:@"E14th and 4th Ave"
               latitude:@"40.734403"
              longitude:@"-73.989551"
                  likes:@"12"
               dislikes:@"15"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"8"
                   name:@"3rd St and 6th Ave"
               latitude:@"40.731021"
              longitude:@"-74.001374"
                  likes:@"5"
               dislikes:@"27"
               freepita:@"NO"
          drinkincluded:@"NO"
             greensauce:@"NO"];
    
    [cartsData saveData:@"9"
                   name:@"Bleeker and Macdougal"
               latitude:@"40.732842"
              longitude:@"-74.000044"
                  likes:@"24"
               dislikes:@"10"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"10"
                   name:@"Waverly and 6th Ave"
               latitude:@"40.729065"
              longitude:@"-73.995667"
                  likes:@"12"
               dislikes:@"2"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"NO"];
    
    [cartsData saveData:@"11"
                   name:@"13th St and 5th Ave"
               latitude:@"40.735314"
              longitude:@"-73.994079"
                  likes:@"2"
               dislikes:@"0"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"12"
                   name:@"Morton and Bedford"
               latitude:@"40.731005"
              longitude:@"-74.004679"
                  likes:@"16"
               dislikes:@"16"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"13"
                   name:@"Macdougal and Houston"
               latitude:@"40.728091"
              longitude:@"-74.002115"
                  likes:@"40"
               dislikes:@"23"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"];
    
    [cartsData saveData:@"14"
                   name:@"Bleeker and Christopher"
               latitude:@"40.733351"
              longitude:@"-74.004228"
                  likes:@"20"
               dislikes:@"3"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"NO"];
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7286689
                                                            longitude:-73.99566199999998
                                                                 zoom:15];
    mapView_  = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position   = CLLocationCoordinate2DMake(40.7286689, -73.99566199999998);
    marker.title      = @"You";
    marker.snippet    = @"Hungry for Halal";
    marker.map        = mapView_;
    
  
    NSArray  *cartDataRow = [cartsData findByCartId:@"1"];
    NSString *cartName    = [cartDataRow objectAtIndex:0];
    NSLog(@"%@", cartName);
    
    float latitude   = [cartDataRow[1] floatValue];
    float longitude  = [cartDataRow[2] floatValue];
    GMSMarker *cart1 = [[GMSMarker alloc] init];
    cart1.position   = CLLocationCoordinate2DMake(latitude, longitude);
    cart1.title      = cartName;
    cart1.snippet    = [ NSString stringWithFormat:@"Likes = %@. Dislikes = %@", [cartDataRow objectAtIndex:3], [cartDataRow objectAtIndex:4] ];
    cart1.map        = mapView_;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
