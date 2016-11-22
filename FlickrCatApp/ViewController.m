//
//  ViewController.m
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *jsonUrl = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=a7e8eeb660518f4cb05325751027181d&tags=cat"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonUrl];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON error: %@", jsonError.localizedDescription);
            return;
        }
        
        NSDictionary *photosDict = jsonDictionary[@"photos"];
        NSArray *arrayOfPhotos = photosDict[@"photo"];
        
    }];
    
    [dataTask resume];
    
}

@end
