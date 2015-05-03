//
//  FavoritesDatabaseHelper.m
//  HalalMapper
//
//  Created by Jeff Lee on 5/2/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "FavoritesDatabaseHelper.h"

@implementation FavoritesDatabaseHelper

static FavoritesDatabaseHelper *sharedInstance = nil;
static sqlite3      *database                  = nil;
static sqlite3_stmt *statement                 = nil;



+ (FavoritesDatabaseHelper*) getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}


- (BOOL) createDB {
    NSString *docsDir;
    NSArray  *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir  = dirPaths[0];
    // Build the path to the database file
    databasePath           = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"carts.db"]];
    BOOL isSuccess         = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            char       *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS favorites (name text, latitude text, longitude text, likes text, dislikes text, freepita text, drinkincluded text, greensauce text)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}


- (BOOL) saveData:(NSArray*)cartData   {
    
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO favorites (name,latitude,longitude,likes,dislikes,freepita,drinkincluded, greensauce) values (\"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", cartData[0], cartData[1], cartData[2], cartData[3], cartData[4], cartData[5], cartData[6], cartData[7]];
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            return YES;
        }
        else {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}

- (NSArray*) findByName:(NSString*) name {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name, latitude, longitude, likes, dislikes, freepita, drinkincluded, greensauce FROM favorites WHERE name=\"%@\"",name];
        
        const char *query_stmt      = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *name      = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                
                NSString *latitude  = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:latitude];
                
                NSString *longitude = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:longitude];
                
                NSString *likes     = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 3)];
                [resultArray addObject:likes];
                
                NSString *dislikes  = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 4)];
                [resultArray addObject:dislikes];
                
                NSString *freepita  = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 5)];
                [resultArray addObject:freepita];
                
                NSString *drinkincluded = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 6)];
                [resultArray addObject:drinkincluded];
                
                NSString *greensauce    = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 7)];
                [resultArray addObject:greensauce];
                
                return resultArray;
            }
            else {
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_reset(statement);
        }
    }
    return nil;
}
@end
