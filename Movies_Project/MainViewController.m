//
//  ViewController.m
//  Movies_Project
//
//  Created by Petar Ivic on 02/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "MainViewController.h"
#import "CustomMovieCell.h"


@interface MainViewController ()

@end

NSString *cellId = @"cellId";

@implementation MainViewController



- (void)viewDidLoad
{
     [super viewDidLoad];

    self.navigationItem.title = @"Discover Movies";
    self.navigationController.navigationBar.prefersLargeTitles = YES;

     UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    

    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];

    [_collectionView registerClass:[CustomMovieCell class] forCellWithReuseIdentifier:cellId];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:_collectionView];


}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomMovieCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];

    cell.clipsToBounds = true;
    cell.layer.cornerRadius = 18;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//
    CGFloat newSize = 0;
    newSize = (self.view.frame.size.width - 3 * 8) / 2;
    
    return CGSizeMake(newSize, newSize + 28);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
return 8;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
return 1;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(16, 8, 0, 8);
}

@end
