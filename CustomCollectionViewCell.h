//
//  CustomCollectionViewCell.h
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewCell : UICollectionViewCell<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property(strong,nonatomic) UICollectionView *collectionView;
@property(strong,nonatomic) UICollectionViewFlowLayout *flowLayout;



@end

NS_ASSUME_NONNULL_END
