//
//  Photo.m
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithfarmNumber:(NSNumber *)farmNum serverId:(NSString *)serverId photoId:(NSString *)photoId secret:(NSString *)photoSecret andTitle:(NSString *)title {
    
    self = [super init];
    if (self) {
        _farmNumber = farmNum;
        _serverId = serverId;
        _photoId = photoId;
        _photoSecret = photoSecret;
        _photoTitle = title;
        [self createPhotoUrl];
    }   
    return self;
}

- (void)createPhotoUrl {
    NSString *urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farmNumber, self.serverId, self.photoId, self.photoSecret];
    
    self.photoUrl = [NSURL URLWithString:urlString];
}

@end


