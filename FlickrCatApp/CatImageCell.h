//
//  CatImageCell.h
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;

@interface CatImageCell : UICollectionViewCell

- (void)configureCell:(Photo *)photo;

@end
