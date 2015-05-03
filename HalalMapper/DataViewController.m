//
//  DataViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/29/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "DataViewController.h"
#import "FavoritesDatabaseHelper.h"

@implementation DataViewController

@synthesize cartAddress;
@synthesize thumbsUp;
@synthesize thumbsDown;
@synthesize drinkBool;
@synthesize pitaBool;
@synthesize greenSauceBool;
@synthesize favoriteButton;


NSArray *currentCart;

- (BOOL) setCurrentCart: (NSArray *) cart {
    currentCart = cart;
    return YES;
}

- (void) viewDidLoad {
    cartAddress.text    = currentCart[0];
    thumbsUp.text       = currentCart[3];
    thumbsDown.text     = currentCart[4];
    drinkBool.text      = currentCart[5];
    pitaBool.text       = currentCart[6];
    greenSauceBool.text = currentCart[7];
}

- (IBAction)favoriteThisCart:(id)sender {
    FavoritesDatabaseHelper *favorites = [FavoritesDatabaseHelper getSharedInstance];
    NSLog(@"shitty");
    [favorites saveData: currentCart[0]];
    NSLog(@"hey fuckhead");
    NSArray *poo = [favorites findByName: currentCart[0]];
//    for (int i = 0; [poo count] - 1; i++) {
//        NSLog(@"%@", [poo[i] stringValue]);
//    }
//
 
    
    
    
}

@end


