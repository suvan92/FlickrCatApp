//
//  CatImageCell.m
//  FlickrCatApp
//
//  Created by Suvan Ramani on 2016-11-21.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "CatImageCell.h"
#import "Photo.h"

@interface CatImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
@property (weak, nonatomic) IBOutlet UILabel *catImageTitleLabel;

@end


@implementation CatImageCell

- (void)configureCell:(Photo *)photo {
    
    self.catImageView.image = photo.photoImage;
    self.catImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.catImageTitleLabel.text = photo.photoTitle;
}

@end
