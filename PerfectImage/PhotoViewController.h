//
//  PhotoViewController.h
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;
@protocol PhotoViewControllerDelegate <NSObject>

@optional

- (void) didTappedHeart;

@end

@interface PhotoViewController : UIViewController
@property (nonatomic, assign) id <PhotoViewControllerDelegate> delegate;
@property Photo *photo;
@property BOOL isFavorite;

@end
