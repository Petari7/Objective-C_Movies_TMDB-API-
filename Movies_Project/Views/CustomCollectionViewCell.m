//
//  CustomCollectionViewCell.m
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>




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
_actorImage = UIImageView.new;
_actorImage.translatesAutoresizingMaskIntoConstraints = false;


[self.contentView addSubview:_actorImage];
[_actorImage.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = true;
[_actorImage.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:0].active = true;
[_actorImage.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = true;

[_actorImage.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = true;

_actorImage.backgroundColor = [UIColor whiteColor];


}
@end
