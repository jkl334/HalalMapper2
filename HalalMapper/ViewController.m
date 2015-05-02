//
//  ViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController {
    GMSMapView *mapView_;
}

@synthesize manager;
@synthesize currentLocation;
@synthesize touchMapCoordinate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the database
    NSObject_DatabaseHelper *cartsData = [DatabaseLoader getDatabase];

    // Initialize the map view on Courant
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
    
    // Array of records from DB
    NSMutableArray      *cartArray = [[NSMutableArray alloc] initWithCapacity: 14];
    // Dictionary. Key = Marker. Value = Record from array
    NSMutableDictionary *cartsList = [[NSMutableDictionary alloc] init];
    for (int i = 1; i < 15; i++) {
        NSArray *cartDataRow = [cartsData findByCartId:[NSString stringWithFormat:@"%i", i]];
        [cartArray insertObject:cartDataRow atIndex: i-1];
    }
    
    
    for (NSArray *halalCart in cartArray) {
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake([halalCart[1] floatValue], [halalCart[2] floatValue]);
        GMSMarker *marker = [GMSMarker markerWithPosition:location];
        marker.title = halalCart[0];
        marker.snippet = [NSString stringWithFormat:@"Likes = %@. Dislikes = %@", halalCart[3], halalCart[4]];
        marker.map = mapView_;
        [cartsList setObject: halalCart forKey:marker];
    }
    
    
    
    
    
    /*
     storeMarkerMap = [[NSDictionary alloc] init];
     
     for(StoreInfo *info in storesArray){
     
     CLLocationCoordinate2D pos = CLLocationCoordinate2DMake(info.lat,info.lng);
     GMSMarker *marker = [GMSMarker markerWithPosition:pos];
     marker.title = info.name;
     marker.snippet = info.type;
     marker.icon =[self iconSelector: info];
     marker.map = mapView_;
     [storeMarkerMap setObject:info forKey:marker];
     }
     
     */
    
    
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
    
    
    //END - populating markers on map

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
