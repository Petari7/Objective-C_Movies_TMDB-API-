//
//  CustomMovieCell.m
//  Movies_Project
//
//  Created by Petar Ivic on 03/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "CustomMovieCell.h"
#import <SDWebImage/SDWebImage.h>


@implementation CustomMovieCell 





- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        
[self setupViews];
[self cellStylizing];
        
        
      
        
        
}
return self;
    
    
}




-(void) cellStylizing
{
    
    
    
    self.layer.shadowOffset = CGSizeMake(1, 0);
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = .50;
}

//-MARK: Added UIImageView & UILabel on Cell
- (void)setupViews {
    _movieLabel = UILabel.new;
    _movieImage = UIImageView.new;
    _movieImage.translatesAutoresizingMaskIntoConstraints = false;
    
    _movieLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:_movieLabel];
    [self.contentView addSubview:_movieImage];
    [_movieImage.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-58].active = true;
    [_movieImage.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:0].active = true;
    [_movieImage.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = true;
    
    [_movieImage.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = true;
    
    _movieImage.backgroundColor = [UIColor whiteColor];
    
    [_movieLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = true;
    
    [_movieLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:4].active = true;
    
    [_movieLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = true;
    
    [_movieLabel.topAnchor constraintEqualToAnchor:self.movieImage.bottomAnchor constant:0].active = true;
    
    [_movieLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    _movieLabel.text = @"Captain Coruse";
    _movieLabel.numberOfLines = 0;
    [_movieLabel sizeToFit];
    _movieLabel.textColor = [UIColor blackColor];
    _movieLabel.textAlignment = NSTextAlignmentLeft;
  
    
    self.backgroundColor = [UIColor whiteColor];
}




@end
