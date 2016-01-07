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

       
    }
    
    return self;
}

@end
