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


// Properties
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
    UIImage *manIcon    = [UIImage imageNamed:@"man"];
    GMSMarker *marker   = [[GMSMarker alloc] init];
    marker.position     = CLLocationCoordinate2DMake(40.7286689, -73.99566199999998);
    marker.title        = @"You";
    marker.snippet      = @"Hungry for Halal";
    marker.icon         = manIcon;
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
    
    // Get Tapped Cart Data
    NSObject_DatabaseHelper *database = [DatabaseLoader getDatabase];
    NSArray *cartDataToPush           = [database findByName:marker.title];
    
    // Prepare dataViewController to push
    UIStoryboard       *storyboard         = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DataViewController *dataViewController = (DataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"dataViewController"];
    // Set current Cart in dataView
    [dataViewController setCurrentCart:cartDataToPush];
    [self.navigationController pushViewController:dataViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToFavorite"]) {

        FavoritesDatabaseHelper *favorites = [FavoritesDatabaseHelper getSharedInstance];
        NSMutableArray *cartArray = [[NSMutableArray alloc] initWithCapacity:[favorites getCount]];
        for (int i =0; i < [favorites getCount]; i++) {
            NSArray *favoriteItem = [favorites findByName:[NSString stringWithFormat:@"%i", i]];
            [cartArray insertObject:cartDataRow atIndex: i];
        }
        // Get faves and pass into tableView
        
        FavoriteViewControllerTableViewController *destination = segue.destinationViewController;
        //destination.theArrayOfFavoritesData = myArray;
        
    }
}


@end
