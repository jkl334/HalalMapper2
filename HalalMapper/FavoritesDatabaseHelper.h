//
//  FavoritesDatabaseHelper.h
//  HalalMapper
//
//  Created by Jeff Lee on 5/2/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FavoritesDatabaseHelper : NSObject {
    NSString *databasePath;
}

+ (FavoritesDatabaseHelper*) getSharedInstance;

- (BOOL) createDB;

- (BOOL) saveData:(NSArray*)cartData;

- (int) getCount;

- (NSArray*) findByName:(NSString*)name;

- (NSMutableArray*) getAll;

@end
