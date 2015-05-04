//
//  DataViewController.m
//  HalalMapper
//
//  Created by Liam Mellor on 4/29/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "DataViewController.h"
#import "FavoritesDatabaseHelper.h"
#import "NSObject_DatabaseHelper.h"

@implementation DataViewController

@synthesize cartAddress;
@synthesize thumbsUp;
@synthesize thumbsDown;
@synthesize drinkBool;
@synthesize pitaBool;
@synthesize greenSauceBool;
@synthesize favoriteButton;
@synthesize upButton;
@synthesize downButton;

BOOL opinionTaken = NO;


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
    if ([favorites findByName: currentCart[0]] != NULL) {
        //do nothing
        NSLog(@"Already in favorites");
    } else {
        [favorites saveData: currentCart[0]];
    }
}

- (IBAction)like:(id)sender {
    NSObject_DatabaseHelper *db = [NSObject_DatabaseHelper getSharedInstance];
    if ([db findByName: currentCart[0]] != NULL && !opinionTaken) {
        [db updateLikes:currentCart[0] likes:[currentCart[3] integerValue]];
        NSObject_DatabaseHelper *db2 = [NSObject_DatabaseHelper getSharedInstance];
        NSArray *cart = [db2 findByName:currentCart[0]];
        int likes = [cart[3] intValue];
        thumbsUp.text = [NSString stringWithFormat:@"%d", likes + 1];
        opinionTaken = YES;
    }
}
- (IBAction)dislike:(id)sender {
    NSObject_DatabaseHelper *db = [NSObject_DatabaseHelper getSharedInstance];
    if ([db findByName: currentCart[0]] != NULL && !opinionTaken) {
        [db updateLikes:currentCart[0] likes:[currentCart[4] integerValue]];
        NSObject_DatabaseHelper *db2 = [NSObject_DatabaseHelper getSharedInstance];
        NSArray *cart = [db2 findByName:currentCart[0]];
        int dislikes = [cart[4] intValue];
        thumbsDown.text = [NSString stringWithFormat:@"%d", dislikes + 1];
        opinionTaken = YES;
    }
}


@end


