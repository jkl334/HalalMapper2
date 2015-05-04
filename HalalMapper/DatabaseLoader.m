//
//  DatabaseLoader.m
//  HalalMapper
//
//  Created by Liam Mellor on 5/2/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import "DatabaseLoader.h"

@implementation DatabaseLoader

+ (void) createDatabaseAndLoad {
    
    NSObject_DatabaseHelper *cartsData = [NSObject_DatabaseHelper getSharedInstance];
    
    [cartsData saveData:@"0"
                   name:@"Washing Sqr South and LaGuardia"
               latitude:@"40.729912"
              longitude:@"-73.997630"
                  likes:@"20"
               dislikes:@"3"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"1"
                   name:@"W Houston and Broadway"
               latitude:@"40.725374"
              longitude:@"-73.996959"
                  likes:@"26"
               dislikes:@"14"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$6.00"];
    
    [cartsData saveData:@"2"
                   name:@"Broadway and Astor"
               latitude:@"40.729864"
              longitude:@"-73.992898"
                  likes:@"2"
               dislikes:@"16"
               freepita:@"NO"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"3"
                   name:@"Rafiqis E8th and Broadway"
               latitude:@"40.730693"
              longitude:@"-73.992190"
                  likes:@"27"
               dislikes:@"13"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$6.00"];
    
    [cartsData saveData:@"4"
                   name:@"E14th and 3rd Ave"
               latitude:@"40.733265"
              longitude:@"-73.987513"
                  likes:@"18"
               dislikes:@"15"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"5"
                   name:@"E14th and 4th Ave"
               latitude:@"40.734403"
              longitude:@"-73.989551"
                  likes:@"12"
               dislikes:@"15"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$6.00"];
    
    [cartsData saveData:@"6"
                   name:@"3rd St and 6th Ave"
               latitude:@"40.731021"
              longitude:@"-74.001374"
                  likes:@"5"
               dislikes:@"27"
               freepita:@"NO"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"7"
                   name:@"Bleeker and Macdougal"
               latitude:@"40.729197"
              longitude:@"-74.001020"
                  likes:@"24"
               dislikes:@"10"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"8"
                   name:@"Waverly and 6th Ave"
               latitude:@"40.732945"
              longitude:@"-73.999819"
                  likes:@"12"
               dislikes:@"2"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"9"
                   name:@"13th St and 5th Ave"
               latitude:@"40.735314"
              longitude:@"-73.994079"
                  likes:@"2"
               dislikes:@"0"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"10"
                   name:@"Morton and Bedford"
               latitude:@"40.731005"
              longitude:@"-74.004679"
                  likes:@"16"
               dislikes:@"16"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"11"
                   name:@"Macdougal and Houston"
               latitude:@"40.728091"
              longitude:@"-74.002115"
                  likes:@"40"
               dislikes:@"23"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"12"
                   name:@"Bleeker and Christopher"
               latitude:@"40.733351"
              longitude:@"-74.004228"
                  likes:@"20"
               dislikes:@"3"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"13"
                   name:@"W4th and Washington Square East"
               latitude:@"40.729224"
              longitude:@"-73.996010"
                  likes:@"13"
               dislikes:@"18"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"14"
                   name:@"Halal Guys 53rd and 6th Ave"
               latitude:@"40.761941"
              longitude:@"-73.979230"
                  likes:@"79"
               dislikes:@"2"
               freepita:@"YES"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"15"
                   name:@"Halal Guys 52nd and 6th Ave"
               latitude:@"40.761307"
              longitude:@"-73.979745"
                  likes:@"69"
               dislikes:@"5"
               freepita:@"YES"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"16"
                   name:@"W45th St and 10th Ave"
               latitude:@"40.761645"
              longitude:@"-73.993853"
                  likes:@"6"
               dislikes:@"19"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"17"
                   name:@"Lorimer St and Grand St"
               latitude:@"40.711343"
              longitude:@"-73.948481"
                  likes:@"4"
               dislikes:@"1"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"18"
                   name:@"Havemeyer St and Metropolitan Ave"
               latitude:@"40.714228"
              longitude:@"-73.955326"
                  likes:@"46"
               dislikes:@"79"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$6.00"];
    
    [cartsData saveData:@"19"
                   name:@"Hewes St and Broadway"
               latitude:@"40.706594"
              longitude:@"-73.952258"
                  likes:@"23"
               dislikes:@"28"
               freepita:@"YES"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$6.00"];
    
    [cartsData saveData:@"20"
                   name:@"Fulton St and Broadway"
               latitude:@"40.709261"
              longitude:@"-74.010537"
                  likes:@"55"
               dislikes:@"34"
               freepita:@"NO"
          drinkincluded:@"YES"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"21"
                   name:@"E 1st St and 2nd Ave"
               latitude:@"40.724452"
              longitude:@"-73.990903"
                  likes:@"78"
               dislikes:@"22"
               freepita:@"YES"
          drinkincluded:@"YES"
             greensauce:@"YES"
                  price:@"$5.00"];
    
    [cartsData saveData:@"22"
                   name:@"Jay St Metrotech"
               latitude:@"40.692327"
              longitude:@"-73.985431"
                  likes:@"63"
               dislikes:@"11"
               freepita:@"YES"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$5.00"];
    
    [cartsData saveData:@"23"
                   name:@"E 14th St and Ave A"
               latitude:@"40.730241"
              longitude:@"-73.980238"
                  likes:@"33"
               dislikes:@"28"
               freepita:@"NO"
          drinkincluded:@"NO"
             greensauce:@"NO"
                  price:@"$6.00"];
    
}

+ (NSObject_DatabaseHelper *) getDatabase {
    
    NSObject_DatabaseHelper *cartsData = [NSObject_DatabaseHelper getSharedInstance];
    return cartsData;
}

+ (NSMutableArray *) getArrayOfCarts {
    
    NSObject_DatabaseHelper *cartsData = [NSObject_DatabaseHelper getSharedInstance];
    
    // Array of records from DB
    NSMutableArray *cartArray = [[NSMutableArray alloc] initWithCapacity: 24];
    for (int i = 0; i < 24; i++) {
        NSArray *cartDataRow = [cartsData findByCartId:[NSString stringWithFormat:@"%i", i]];
        [cartArray insertObject:cartDataRow atIndex: i];
    }
    return cartArray;
}

@end


