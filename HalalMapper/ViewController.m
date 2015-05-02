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
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   NSObject_DatabaseHelper *dataManager = [[NSObject_DatabaseHelper alloc] init];
    
//    [DBManager getSharedInstance]saveData:
//    regNoTextField.text name:nameTextField.text department:
//    departmentTextField.text year:yearTextField.text];
    
    BOOL yesss;
    [[NSObject_DatabaseHelper getSharedInstance] createDB];
    yesss = [[NSObject_DatabaseHelper getSharedInstance]saveData:@"1" name:@"W4th and Greene" latitude:@"40.729065" longitude:@"-73.995667" likes:@"20" dislikes:@"3" freepita:@"YES" drinkincluded:@"YES" greensauce:@"NO"];
   /*
    //pushing placeholder data
    [dataManager saveData:@"1" name:@"W4th and Greene" latitude:@"40.729065" longitude:@"-73.995667" likes:@"20" dislikes:@"3" freepita:@"YES" drinkincluded:@"YES" greensauce:@"NO"];
    [dataManager saveData:@"2" name:@"W4th and Washington Sqr East" latitude:@"40.729224" longitude:@"-73.996010" likes:@"16" dislikes:@"11" freepita:@"NO" drinkincluded:@"NO" greensauce:@"YES"];
    [dataManager saveData:@"3" name:@"W Houston and Broadway" latitude:@"40.725374" longitude:@"-73.996959" likes:@"26" dislikes:@"14" freepita:@"NO" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"4" name:@"Broadway and Astor" latitude:@"40.729864" longitude:@"-73.992898" likes:@"2" dislikes:@"16" freepita:@"NO" drinkincluded:@"NO" greensauce:@"NO"];
    [dataManager saveData:@"5" name:@"Rafiqis E8th and Broadway" latitude:@"40.730693" longitude:@"-73.992190" likes:@"27" dislikes:@"13" freepita:@"YES" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"6" name:@"E14th and 3rd Ave" latitude:@"40.733265" longitude:@"-73.987513" likes:@"18" dislikes:@"15" freepita:@"NO" drinkincluded:@"YES" greensauce:@"NO"];
    [dataManager saveData:@"7" name:@"E14th and 4th Ave" latitude:@"40.734403" longitude:@"-73.989551" likes:@"12" dislikes:@"15" freepita:@"NO" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"8" name:@"3rd St and 6th Ave" latitude:@"40.731021" longitude:@"-74.001374" likes:@"5" dislikes:@"27" freepita:@"NO" drinkincluded:@"NO" greensauce:@"NO"];
    [dataManager saveData:@"9" name:@"Bleeker and Macdougal" latitude:@"40.732842" longitude:@"-74.000044" likes:@"24" dislikes:@"10" freepita:@"YES" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"10" name:@"Waverly and 6th Ave" latitude:@"40.729065" longitude:@"-73.995667" likes:@"12" dislikes:@"2" freepita:@"YES" drinkincluded:@"YES" greensauce:@"NO"];
    [dataManager saveData:@"11" name:@"13th St and 5th Ave" latitude:@"40.735314" longitude:@"-73.994079" likes:@"2" dislikes:@"0" freepita:@"NO" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"12" name:@"Morton and Bedford" latitude:@"40.731005" longitude:@"-74.004679" likes:@"16" dislikes:@"16" freepita:@"YES" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"13" name:@"Macdougal and Houston" latitude:@"40.728091" longitude:@"-74.002115" likes:@"40" dislikes:@"23" freepita:@"YES" drinkincluded:@"YES" greensauce:@"YES"];
    [dataManager saveData:@"14" name:@"Bleeker and Christopher" latitude:@"40.733351" longitude:@"-74.004228" likes:@"20" dislikes:@"3" freepita:@"NO" drinkincluded:@"YES" greensauce:@"NO"];
    */
    
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
    
  
    NSArray *dankness = [[NSObject_DatabaseHelper getSharedInstance] findByCartId:@"1"];
    
    
    float latitude1  = [dankness[2] integerValue];
    float longitude2 = [dankness[3] integerValue];
    GMSMarker *cart1 = [[GMSMarker alloc] init];
    cart1.position   = CLLocationCoordinate2DMake(latitude1, longitude2);
    cart1.title      = @"HEY";
    cart1.snippet    = @"likes:200 dislikes: 32";
    cart1.map        = mapView_;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
