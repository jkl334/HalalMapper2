//
//  ViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/27/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DataViewController.h"


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
    
    // Initialize the map view on Courant
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7286689
                                                            longitude:-73.99566199999998
                                                                 zoom:15];
    mapView_  = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate          = self;
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    UIImage *youAreHere = [UIImage imageNamed:@"man"];
    GMSMarker *marker   = [[GMSMarker alloc] init];
    marker.position     = CLLocationCoordinate2DMake(40.7286689, -73.99566199999998);
    marker.title        = @"You";
    marker.snippet      = @"Hungry for Halal";
    marker.icon         = youAreHere;
    marker.map          = mapView_;
    
    /* Initialize The Map with Markers */
    NSMutableArray      *cartArray = [DatabaseLoader getArrayOfCarts];
    NSMutableDictionary *cartsList = [[NSMutableDictionary alloc] init];
    UIImage             *cartIcon  = [UIImage imageNamed:@"cartMarker"];
    
    // init dictionary of markers
    for (NSArray *halalCart in cartArray) {
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake([halalCart[1] floatValue], [halalCart[2] floatValue]);
        GMSMarker *marker = [GMSMarker markerWithPosition:location];
        marker.title      = halalCart[0];
        marker.snippet    = [NSString stringWithFormat:@"Likes = %@. Dislikes = %@", halalCart[3], halalCart[4]];
        marker.icon       = cartIcon;
        marker.map        = mapView_;
        [cartsList setObject: halalCart forKey:marker];
    }
}

- (void) mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DataViewController *dataViewController = (DataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"dataViewController"];
    [self presentViewController:dataViewController animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
