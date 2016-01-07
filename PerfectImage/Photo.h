//
//  Photo.h
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Photo : NSObject <NSCoding>

@property UIImage *image;
@property UIImage *thumbnail;
@property NSString *photoID;
@property BOOL isFavorite;
@property double latitude;
@property double longitude;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end

