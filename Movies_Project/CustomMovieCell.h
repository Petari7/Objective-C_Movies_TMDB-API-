//
//  CustomMovieCell.h
//  Movies_Project
//
//  Created by Petar Ivic on 03/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomMovieCell : UICollectionViewCell

@property(strong, nonatomic) UILabel *movieLabel;
@property(strong, nonatomic) UIImageView *movieImage;
@property(strong, nonatomic) NSNumber *identifier;

@end

NS_ASSUME_NONNULL_END
