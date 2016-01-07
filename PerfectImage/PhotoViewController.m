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

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoImage.image = self.photo.image;
    
}


@end
