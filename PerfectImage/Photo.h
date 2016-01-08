//
//  Photo.h
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject <NSCoding>

@property UIImage *image;
@property NSString *photoID;
@property NSString *userID;
@property NSString *userFullname;
@property UIImage *userPic;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

