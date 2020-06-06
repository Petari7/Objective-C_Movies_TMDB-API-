//
//  CustomCollectionViewCell.m
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "ActorModel.h"




@implementation CustomCollectionViewCell 


- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
    
    [self setupViews];
        
}
    return self;
    
    
}
//-MARK: Added Views, Layout Code

-(void) setupViews {
_movieImage = UIImageView.new;
_movieImage.translatesAutoresizingMaskIntoConstraints = false;


[self.contentView addSubview:_movieImage];
[_movieImage.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = true;
[_movieImage.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:0].active = true;
[_movieImage.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = true;

[_movieImage.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = true;

_movieImage.backgroundColor = [UIColor whiteColor];


}
@end
