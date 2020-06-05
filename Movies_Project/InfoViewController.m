//
//  InfoViewController.m
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "InfoViewController.h"
#import "MoviesModel.h"
#import "CustomCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface InfoViewController ()


;

@end

NSString *cellid = @"cellId";

@implementation InfoViewController

- (void)setupBlurEffect {
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.translatesAutoresizingMaskIntoConstraints = false;
    
    
    
    [self.backGroundImageView addSubview:visualEffectView];
    
    
    [visualEffectView.topAnchor constraintEqualToAnchor:self.backGroundImageView.topAnchor constant: 0].active = true;
    
    
    [visualEffectView.leftAnchor constraintEqualToAnchor:self.backGroundImageView.leftAnchor constant: 0].active = true;
    
    [visualEffectView.rightAnchor constraintEqualToAnchor:self.backGroundImageView.rightAnchor constant: 0].active = true;
    
    
    
    [visualEffectView.bottomAnchor constraintEqualToAnchor:self.backGroundImageView.bottomAnchor constant: 0].active = true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    
    
    [self setupBlurEffect];

    
    
    
     

      
    
    NSString *str = @"https://image.tmdb.org/t/p/w185";
    str = [str stringByAppendingString:_movie.poster_path];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString: str ]];
    
    NSString *string = @"https://image.tmdb.org/t/p/w185";
    string = [string stringByAppendingString: _movie.backdrop_path];
    
    [self.backGroundImageView sd_setImageWithURL:[NSURL URLWithString: string ]];
    
    
    
     UICollectionView *collectionView;

     UICollectionViewFlowLayout *layout;
     layout = UICollectionViewFlowLayout.new;
      collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
      collectionView.translatesAutoresizingMaskIntoConstraints = false;



     [self.view addSubview:collectionView];
     [collectionView.topAnchor constraintEqualToAnchor:self.overviewLabel.bottomAnchor constant: 4].active = true;
    collectionView.backgroundColor = [UIColor clearColor];

   [collectionView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 0].active = true;

     [collectionView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
     [collectionView.heightAnchor constraintEqualToConstant:150].active = true;
    

    
     self.actersLabel = UILabel.new;
    self.actersLabel.text = @"Acters";
    
    self.actersLabel.textColor = [UIColor blackColor];
    self.actersLabel.translatesAutoresizingMaskIntoConstraints = false;
      [collectionView addSubview:_actersLabel];
    [self.actersLabel.topAnchor constraintEqualToAnchor:collectionView.topAnchor constant: 12].active = true;
     

    [self.actersLabel.leftAnchor constraintEqualToAnchor:collectionView.leftAnchor constant: 12].active = true;

    [self.actersLabel.heightAnchor constraintEqualToConstant:20].active = true;

   self.navigationItem.title = self.movie.title;
self.view.backgroundColor = [UIColor whiteColor];

   [collectionView setDataSource:self];
   [collectionView setDelegate:self];


   [collectionView registerClass:[CustomCollectionViewCell class ] forCellWithReuseIdentifier:cellid];
//
//
//
    
    
}

-(void)setupViews {
    
  
    
    
    _backGroundImageView = UIImageView.new;
    _backGroundImageView.translatesAutoresizingMaskIntoConstraints = false;
    _backGroundImageView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_backGroundImageView];

    [_backGroundImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:0].active = true;
    [_backGroundImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active = true;
    [_backGroundImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0].active = true;
    [_backGroundImageView.heightAnchor constraintEqualToConstant:200].active = true;
    
    self.imageView = UIImageView.new;
    self.imageView.translatesAutoresizingMaskIntoConstraints = false;
    self.imageView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.imageView];

    [self.imageView.topAnchor constraintEqualToAnchor:self.backGroundImageView.bottomAnchor constant:-58].active = true;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.backGroundImageView.leftAnchor constant:24].active = true;
    [self.imageView.widthAnchor constraintEqualToConstant:110].active = true;
    [self.imageView.heightAnchor constraintEqualToConstant:110].active = true;
    self.imageView.layer.cornerRadius = 55;
    self.imageView.clipsToBounds = YES;
    
    
    self.tagLineLabel = UILabel.new;
    self.tagLineLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.tagLineLabel.text = @"Being a superhero is in his blood";
 
    self.tagLineLabel.numberOfLines = 0;
    self.tagLineLabel.textColor = [UIColor grayColor];
    
    [self.view addSubview:self.tagLineLabel];

    [self.tagLineLabel.topAnchor constraintEqualToAnchor:self.backGroundImageView.bottomAnchor constant: 2].active = true;
    
    [self.tagLineLabel.leftAnchor constraintEqualToAnchor:self.imageView.rightAnchor constant: 4].active = true;
    
    [self.tagLineLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    
    
    self.movieNameLabel = UILabel.new;
    self.movieNameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.movieNameLabel.text = @"The Blackout: Invasion Earth";
    
    self.movieNameLabel.numberOfLines = 0;
    self.movieNameLabel.textColor = [UIColor blackColor];
       
    [self.view addSubview:self.movieNameLabel];
    [self.movieNameLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant: 14].active = true;
       
    [self.movieNameLabel.leftAnchor constraintEqualToAnchor:self.imageView.leftAnchor constant: 0].active = true;
       
    [self.movieNameLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    
    
    self.movieInfoLabel = UILabel.new;
    self.movieInfoLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.movieInfoLabel.text = @"Drama * Comedy * Action";
     
    self.movieInfoLabel.numberOfLines = 0;
    self.movieInfoLabel.textColor = [UIColor grayColor];
        
     [self.view addSubview:self.movieInfoLabel];
     [self.movieInfoLabel.topAnchor constraintEqualToAnchor:self.movieNameLabel.bottomAnchor constant: 8].active = true;
        
     [self.movieInfoLabel.leftAnchor constraintEqualToAnchor:self.movieNameLabel.leftAnchor constant: 0].active = true;
        
     [self.movieInfoLabel.rightAnchor constraintEqualToAnchor:self.movieNameLabel.rightAnchor].active = true;
    
    self.separatorView = UIView.new;
    self.separatorView.translatesAutoresizingMaskIntoConstraints = false;
    self.separatorView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
     
        
     [self.view addSubview:self.separatorView];
     [self.separatorView.topAnchor constraintEqualToAnchor:self.movieInfoLabel.bottomAnchor constant: 12].active = true;
        
     [self.separatorView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 0].active = true;
        
     [self.separatorView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    [self.separatorView.heightAnchor constraintEqualToConstant:4].active = true;
    
    
    self.overviewLabel = UILabel.new;
    self.overviewLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.overviewLabel.text = @"The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon.when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon.when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon.when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon.";
     
    self.overviewLabel.numberOfLines = 0;
   
    [self.overviewLabel sizeToFit];
    self.overviewLabel.textColor = [UIColor grayColor];
        
     [self.view addSubview:self.overviewLabel];
     [self.overviewLabel.topAnchor constraintEqualToAnchor:self.separatorView.bottomAnchor constant: 8].active = true;
        
     [self.overviewLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 2].active = true;
        
    [self.overviewLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -2].active = true;
    
    

    
        
    self.secondSeparatorView = UIView.new;
    self.secondSeparatorView.translatesAutoresizingMaskIntoConstraints = false;
    self.secondSeparatorView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
        
    [self.view addSubview:self.secondSeparatorView];
    [self.secondSeparatorView.topAnchor constraintEqualToAnchor:self.overviewLabel.bottomAnchor constant: 12].active = true;
           
    [self.secondSeparatorView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 0].active = true;
           
    [self.secondSeparatorView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
    [self.secondSeparatorView.heightAnchor constraintEqualToConstant:4].active = true;
  
    
  
   
        
    
    
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    return cell;
  
}
    


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 150);
}
@end
