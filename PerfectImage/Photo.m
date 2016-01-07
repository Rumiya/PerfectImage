//
//  Photo.m
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import "Photo.h"

@implementation Photo

//custom init

-(instancetype) initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {

        NSDictionary *images = dictionary [@"images"];
        NSDictionary *standardResolution = images[@"standard_resolution"];

        self.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString: standardResolution[@"url"]]]];
        self.photoID = dictionary[@"id"];
        self.isFavorite = NO;

        if (dictionary [@"location"] != [NSNull null])
        {
            NSDictionary *location = dictionary [@"location"];
            self.latitude = [location[@"latitude"] doubleValue];
            self.longitude = [location [@"longitude"] doubleValue];
        } else {
            self.latitude = 0.0;
            self.longitude = 0.0;
        }

    }

    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.image = [decoder decodeObjectForKey:@"image"];
        self.photoID = [decoder decodeObjectForKey:@"photoID"];
        self.isFavorite = [decoder decodeBoolForKey:@"isFavorite"];
        self.latitude = [decoder decodeDoubleForKey:@"latitude"];
        self.longitude = [decoder decodeDoubleForKey:@"longitude"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_image forKey:@"image"];
    [encoder encodeObject:_photoID forKey:@"photoID"];
    [encoder encodeBool:_isFavorite forKey:@"isFavorite"];
    [encoder encodeDouble:_latitude forKey:@"latitude"];
    [encoder encodeDouble:_longitude forKey:@"longitude"];
}

@end
