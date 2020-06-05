//
//  InfoViewController.h
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) NSString *movieTitle;
@property(strong, nonatomic) Movie *movie;
@property(strong, nonatomic) UIImageView *backGroundImageView;
@property(strong, nonatomic) UIImageView *imageView;
@property(strong, nonatomic) UILabel *movieNameLabel;
@property(strong, nonatomic) UILabel *tagLineLabel;
@property(strong, nonatomic) UILabel *movieInfoLabel;
@property(strong, nonatomic) UIView *separatorView;
@property(strong, nonatomic) UILabel *overviewLabel;
@property(strong, nonatomic) UIView *secondSeparatorView;
@property(strong, nonatomic) UILabel *actersLabel;

//let blurredEfect = UIBlurEffect(style: .regular)
//var visualEffect: UIVisualEffectView!

//@property(strong, nonatomic) UIVisualEffectView *blurredView;
//@property(strong, nonatomic) UIBlurEffect *blurEffect;





@end

NS_ASSUME_NONNULL_END
