//
//  NSObject_DatabaseHelper.h
//  HalalMapper
//
//  Created by Jeff Lee on 4/29/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface NSObject_DatabaseHelper : NSObject
{
    NSString *databasePath;
}

+(NSObject_DatabaseHelper*)getSharedInstance;
- (BOOL) createDB;
- (BOOL) saveData:(NSString*)cartid name:(NSString*)name
         latitude:(NSString*)latitude longitude:(NSString*)longitude
            likes:(NSString*)likes dislikes:(NSString*)dislikes
         freepita:(NSString*)freepita drinkincluded(NSString*)drinkincluded greensauce(NSString*)greensauce;
- (NSArray*) findByRegisterNumber:(NSString*)cartid;

@end
