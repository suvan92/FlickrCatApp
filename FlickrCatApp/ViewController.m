//
//  ViewController.m
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *listOfPhotos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfPhotos = [NSMutableArray new];
    [self flickrJsonPhotoDownload];
}

#pragma mark - Collection View

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    
    return cell;
}


#pragma mark - Flickr JSON

- (void)flickrJsonPhotoDownload {
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
        
        for (NSDictionary *photoInfo in arrayOfPhotos) {
            NSNumber *farmNum = photoInfo[@"farm"];
            NSString *serverId = photoInfo[@"server"];
            NSString *photoId = photoInfo[@"id"];
            NSString *photoSecret = photoInfo[@"secret"];
            NSString *photoTitle = photoInfo[@"title"];
            
            Photo *newPhoto = [[Photo alloc] initWithfarmNumber:farmNum serverId:serverId photoId:photoId secret:photoSecret andTitle:photoTitle];
            [self.listOfPhotos addObject:newPhoto];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            // reload collectionView Data
        }];
    }];
    
    [dataTask resume];
}

@end
