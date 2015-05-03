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
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS favorites (name text)";
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


- (BOOL) saveData:(NSString*)name {
    
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO favorites (name) values (\"%@\")", name];
        NSLog(@"%@", insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"Yes");
            return YES;
        }
        else {
             NSLog(@"No");
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}



- (int) getCount {
    const char *dbpath = [databasePath UTF8String];
    int count = 0;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        const char* sqlStatement = "SELECT COUNT(*) FROM favorites";
        sqlite3_stmt *statement;
        
        if( sqlite3_prepare_v2(database, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            //Loop through all the returned rows (should be just one)
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
        }
        else
        {
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
        }
        
        // Finalize and close database.
        sqlite3_finalize(statement);
        sqlite3_close(database);
    }
    
    return count;
}

- (NSString*) findByName:(NSString*) name {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name FROM favorites WHERE name=\"%@\"",name];
        
        const char *query_stmt      = [querySQL UTF8String];
        
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *name      = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                
                return name;
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

- (NSMutableArray*) getAll {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name FROM favorites"];
        
        const char *query_stmt      = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *name      = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                
                return resultArray;
            }
        }
            else {
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_reset(statement);
        
    }
    return nil;
}
@end
