//
//  InfoViewController.h
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviesModel.h"
#import "MovieInfoModel.h"
#import "ActorModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface InfoViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


//-MARK: Properties
@property(strong,nonatomic)UICollectionView *collectionView;
@property (strong,nonatomic) NSString *movieTitle;
@property(strong, nonatomic) Movie *movie;
@property(strong, nonatomic) MovieInfoModel *movieInfo;
@property(strong, nonatomic) UIImageView *backGroundImageView;
@property(strong, nonatomic) UIImageView *imageView;
@property(strong, nonatomic) UILabel *movieNameLabel;
@property(strong, nonatomic) UILabel *tagLineLabel;
@property(strong, nonatomic) UILabel *movieInfoLabel;
@property(strong, nonatomic) UIView *separatorView;
@property(strong, nonatomic) UILabel *overviewLabel;
@property(strong, nonatomic) UIView *secondSeparatorView;
@property(strong, nonatomic) UILabel *actersLabel;




@end

NS_ASSUME_NONNULL_END
