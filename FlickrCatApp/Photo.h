//
//  Photo.h
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSNumber *farmNumber;
@property (nonatomic, strong) NSString *serverId;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSString *photoSecret;
@property (nonatomic, strong) NSString *photoTitle;
@property (nonatomic, strong) NSURL *photoUrl;

- (instancetype)initWithfarmNumber:(NSNumber *)farmNum serverId:(NSString *)serverId photoId:(NSString *)photoId secret:(NSString *)photoSecret andTitle:(NSString *)title;

@end

//"id": "31051084231",
//"owner": "37842091@N08",
//"secret": "6488b856bf",
//"server": "5562",
//"farm": 6,
//"title": "Toronto Cat - 2 of 2",
//"ispublic": 1,
//"isfriend": 0,
//"isfamily": 0

//https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
