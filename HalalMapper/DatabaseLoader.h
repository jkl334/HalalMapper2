//
//  DatabaseLoader.h
//  HalalMapper
//
//  Created by Liam Mellor on 5/2/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject_DatabaseHelper.h"

@interface DatabaseLoader : NSObject

+ (void) createDatabaseAndLoad;

+ (NSMutableArray *) getArrayOfCarts;

@end
