//
//  CustomCollectionViewCell.m
//  Movies_Project
//
//  Created by Petar Ivic on 04/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "CustomCollectionViewCell.h"


@implementation CustomCollectionViewCell 

 

- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        
        
      
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
          
         
         
         UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        
        self.collectionView.backgroundColor = [UIColor clearColor];
        
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView=[[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        
        
         
         [self.collectionView setDataSource:self];
         [self.collectionView setDelegate:self];
            
        self.collectionView.backgroundColor = [UIColor clearColor];
            
         [self.collectionView registerClass:[UICollectionViewCell class ] forCellWithReuseIdentifier:@"cellId"];
        
         
          [self addSubview:self.collectionView];
          [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor constant: 0].active = true;
          
         
          [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant: 0].active = true;
             
          [self.collectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = true;
         
         [self.collectionView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 8].active = true;
         
         
        
      
        
        
    }
    return self;
    
    
}


    
    
    
    



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    cell.layer.cornerRadius = 35;
    cell.clipsToBounds = TRUE;
    
    return cell;
  
}
    


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 70);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(24, 8, 0, 8);
}

@end
