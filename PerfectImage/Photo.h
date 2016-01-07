//
//  Photo.h
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property UIImage *image;


-(instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

