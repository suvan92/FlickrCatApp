//
//  Photo.h
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSNumber *farmNumber;
@property (nonatomic, strong) NSString *serverId;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSString *photoSecret;
@property (nonatomic, strong) NSString *photoTitle;
@property (nonatomic, strong) NSURL *photoUrl;
@property (nonatomic, strong) UIImage *photoImage;

- (instancetype)initWithfarmNumber:(NSNumber *)farmNum serverId:(NSString *)serverId photoId:(NSString *)photoId secret:(NSString *)photoSecret andTitle:(NSString *)title;

@end
