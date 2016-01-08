//
//  PhotoViewController.m
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"

@interface PhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UIImageView *userPicture;
@property (weak, nonatomic) IBOutlet UILabel *userFullname;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;

@property NSMutableArray *favoritesArray;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoImage.image = self.photo.image;
    self.userFullname.text = self.photo.userFullname;
    self.userPicture.image = self.photo.userPic;

    [self load];

    if (self.favoritesArray == nil) {
        self.favoritesArray = [NSMutableArray new];
    }

    if (self.isFavorite) {
        self.heartButton.hidden = YES;
    }
    
}
- (IBAction)onHeartPressed:(UIButton *)sender {
    sender.selected = !sender.selected;

    if (sender.selected) {
        [self.favoritesArray addObject:self.photo];
    } else {
        [self.favoritesArray removeObject:self.photo];
    }

    [self save];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"favoritesChanged" object:nil];
}

#pragma - mark Persistence
- (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

- (void)load {
    NSData *notesData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    self.favoritesArray = [NSKeyedUnarchiver unarchiveObjectWithData:notesData];

}

- (void) save {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.favoritesArray];
    [userDefaults setObject:data forKey:@"photos"];
    [userDefaults synchronize];
    
}

@end
