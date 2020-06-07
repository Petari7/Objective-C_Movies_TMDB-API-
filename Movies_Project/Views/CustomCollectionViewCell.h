//
//  CustomCollectionViewCell.h
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActorModel.h"
#import "InfoViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewCell : UICollectionViewCell;

@property(strong,nonatomic) UICollectionView *collectionView;
@property(strong,nonatomic) UICollectionViewFlowLayout *flowLayout;
@property(strong, nonatomic) UIImageView *actorImage;
@property(strong, nonatomic) ActorModel *actor;



@end

NS_ASSUME_NONNULL_END
