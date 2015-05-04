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
       
    } else {
        [favorites saveData: currentCart[0]];
    }
}

- (IBAction)like:(id)sender {
    NSObject_DatabaseHelper *db = [NSObject_DatabaseHelper getSharedInstance];
    if ([db findByName: currentCart[0]] != NULL && !opinionTaken) {
        NSLog(@"liked");
        [db updateLikes:currentCart[0] likes:[currentCart[3] integerValue]];
        
        NSObject_DatabaseHelper *db2 = [NSObject_DatabaseHelper getSharedInstance];
        
        NSString *newText            = [db2 findByName:currentCart[0]][3];
        NSLog(@"%@", [db2 findByName:currentCart[0]][3]);
        thumbsUp.text = newText;
        opinionTaken  = YES;
    }
}

- (IBAction)dislike:(id)sender {
    NSObject_DatabaseHelper *db = [NSObject_DatabaseHelper getSharedInstance];
    if ([db findByName: currentCart[0]] != NULL && !opinionTaken) {
        NSLog(@"disliked");
        [db updateLikes:currentCart[0] likes:[currentCart[4] integerValue]];
        NSObject_DatabaseHelper *db = [NSObject_DatabaseHelper getSharedInstance];
        thumbsUp.text = [db findByName:currentCart[0]][4];
        opinionTaken = YES;
    }
}


@end


