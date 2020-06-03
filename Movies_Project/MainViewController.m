//
//  ViewController.m
//  Movies_Project
//
//  Created by Petar Ivic on 02/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import "MainViewController.h"
#import "CustomMovieCell.h"
#import "MoviesModel.h"


@interface MainViewController ()

@property(strong,nonatomic) NSMutableArray<Movie *>* movies;





@end

NSString *cellId = @"cellId";

@implementation MainViewController





- (void)viewDidLoad
{
     [super viewDidLoad];
    [self setupCollectionView];
    [self fetchMovies];


}

-(void) fetchMovies {
    
NSString *urlString = @"https://api.themoviedb.org/3/discover/movie?api_key=fea6a69ff7391818240b67fa3bb83786&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=2";
    
NSURL *url = [NSURL URLWithString:urlString];
    
[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
//        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"String : %@", string);
        
NSError *err;
        
NSDictionary *moviesJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
if(err) {
    NSLog(@"Failed to serialize into JSON: %@", error);
    return;
            
        }
        
NSDictionary *dictionary = [moviesJSON objectForKey:@"results"];
        
NSMutableArray<Movie *>*movies = NSMutableArray.new;
        

for(NSDictionary *moviesDict in dictionary) {
            
NSString *title = moviesDict[@"title"];
NSNumber *id = moviesDict[@"id"];
Movie *movie = Movie.new;
movie.title = title;
movie.id = id;
[movies addObject:movie];

            
}
self.movies = movies;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_collectionView reloadData];
    });
    
}] resume];
    
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.movies.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomMovieCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    Movie *movie = self.movies[indexPath.row];
    cell.movieLabel.text = movie.title;
    cell.id = movie.id;
    
    
    cell.layer.shadowOffset = CGSizeMake(1, 0);
    cell.layer.shadowColor = [[UIColor grayColor] CGColor];
    cell.layer.shadowRadius = 5;
    cell.layer.shadowOpacity = .50;
    

   
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//
    CGFloat newSize = 0;
    newSize = (self.view.frame.size.width - 3 * 8) / 2;
    
    return CGSizeMake(newSize, newSize + 48);
    
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

- (void)setupCollectionView {
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

@end
