//
//  DataViewController.h
//  HalalMapper
//
//  Created by Liam Mellor on 4/29/15.
//  Copyright (c) 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cartAddress;
@property (weak, nonatomic) IBOutlet UILabel *thumbsUp;
@property (weak, nonatomic) IBOutlet UILabel *thumbsDown;
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UILabel *drinkBool;
@property (weak, nonatomic) IBOutlet UILabel *pitaBool;
@property (weak, nonatomic) IBOutlet UILabel *greenSauceBool;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

- (BOOL) setCurrentCart: (NSArray *) cart;


@end
