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

        NSDictionary *user = dictionary[@"user"];
        self.userID = user[@"id"];
        self.userFullname = user[@"full_name"];
        self.userPic = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString: user[@"profile_picture"]]]];

    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.image = [decoder decodeObjectForKey:@"image"];
        self.photoID = [decoder decodeObjectForKey:@"photoID"];
        self.userID = [decoder decodeObjectForKey:@"userID"];
        self.userFullname = [decoder decodeObjectForKey:@"userFullname"];
        self.userPic = [decoder decodeObjectForKey:@"userPic"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_image forKey:@"image"];
    [encoder encodeObject:_photoID forKey:@"photoID"];
    [encoder encodeObject:_userID forKey:@"userID"];
    [encoder encodeObject:_userFullname forKey:@"userFullname"];
    [encoder encodeObject:_userPic forKey:@"userPic"];

}


@end
