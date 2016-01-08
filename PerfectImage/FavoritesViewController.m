//
//  FavoritesViewController.m
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@property NSMutableArray *favoritesArray;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    if (self.favoritesArray == nil) {
        self.favoritesArray = [NSMutableArray new];
    }

}


@end
