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

@property NSMutableArray *favoritesArray;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoImage.image = self.photo.image;
    self.userFullname.text = self.photo.userFullname;
    self.userPicture.image = self.photo.userPic;

    self.favoritesArray = [[NSMutableArray alloc] init];
    
}
- (IBAction)onHeartPressed:(UIButton *)sender {
    sender.selected = !sender.selected;

    if (sender.selected) {
        [self.favoritesArray addObject:self.photo];
    } else {
        [self.favoritesArray removeObject:self.photo];

    }
}


@end
