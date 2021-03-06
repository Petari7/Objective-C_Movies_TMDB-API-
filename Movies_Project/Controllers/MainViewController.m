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
#import <SDWebImage/SDWebImage.h>
#import "InfoViewController.h"
#import "MovieInfoModel.h"
#import "ActorModel.h"
#import "CustomCollectionViewCell.h"




@interface MainViewController ()

//-MARK: Properties
@property(strong,nonatomic) NSMutableArray<Movie *>* movies;
@property(strong,nonatomic) NSMutableArray<ActorModel *>* actors;







@end

NSString *cellId = @"cellId";
NSNumber *num;
NSNumber *num2;
NSInteger *lastItem;
int *number = 2;

@implementation MainViewController








- (void)viewDidLoad
{
    
    num = [[NSNumber alloc] initWithInt:1];
    [super viewDidLoad];
    
    [self fetchMovies:num];
    [self setupCollectionView];
    

}




//-MARK: Fetch movie info , URLSession
-(void) fetchMovieInfo: (NSString *) identifier completion:(void(^)(MovieInfoModel* movieInfo, NSURLResponse *response))callback
{

NSString *firstStringTile = @"https://api.themoviedb.org/3/movie/";
NSString *identif = identifier;
NSString *lastStringTile = @"?api_key=fea6a69ff7391818240b67fa3bb83786&language=en-US";
NSString *string = [NSString stringWithFormat:@"%@ %@ %@", firstStringTile, identif, lastStringTile];
    
NSString *urlString;
    
urlString = [string stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

NSURL *url = [NSURL URLWithString:urlString];
    
    
[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

NSError *err;
NSDictionary *moviesInfoJSon = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];

if(err) {
NSLog(@"Failed to serialize into JSON: %@", error);
return;
}



NSString *status = moviesInfoJSon[@"status"];
NSString *overview = moviesInfoJSon[@"overview"];
NSString *releaseDate = moviesInfoJSon[@"release_date"];
NSString *tagline = moviesInfoJSon[@"tagline"];
    
NSDictionary *dictionary = [moviesInfoJSon objectForKey:@"genres"];
    
for(NSDictionary *dict in dictionary) {
        
NSString *genre = dict[@"name"];
MovieInfoModel *movie = MovieInfoModel.new;
movie.genre = genre;
movie.status = status;
movie.overview = overview;
movie.release_date = releaseDate;
movie.tagline = tagline;



    
callback(movie, response);
}


}] resume];






    
    
    
}


//-MARK: Fetch first 20 Movies NSURLSession

-(void) fetchMovies: (NSNumber* ) page{
    
    
   
    NSString *firstUrlString = @"https://api.themoviedb.org/3/discover/movie?api_key=fea6a69ff7391818240b67fa3bb83786&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=";
    NSNumber *pageNumber = page;
    
    NSString *string = [NSString stringWithFormat:@"%@ %@ ", firstUrlString, pageNumber];
    NSString *urlString;
    urlString = [string stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
  
NSURL *url = [NSURL URLWithString:urlString];
    


[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              
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
NSString *identifier = moviesDict[@"id"];
NSString *poster = moviesDict[@"poster_path"];
NSString *backGroundImg = moviesDict[@"backdrop_path"];
Movie *movie = Movie.new;
    
movie.poster_path = poster;
movie.title = title;
movie.identifier = identifier;
movie.backdrop_path = backGroundImg;
    
   
[movies addObject:movie];

                  
}
self.movies = movies;
dispatch_async(dispatch_get_main_queue(), ^{
[self->_collectionView reloadData];
});
    

}] resume];
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    int lastItem  = [self.movies count] -  1;
    if (lastItem == indexPath.row) {
    [self loadMoreData];
    }
    

}

//MARK:- Load more data, Infinite scroll
-(void) loadMoreData {
      
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.45 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
[self fetchOtherMovies:number completion:^(Movie *movie, NSURLResponse *response) {
            
[self. movies addObject:movie];
number++;
dispatch_async(dispatch_get_main_queue(), ^{
[self->_collectionView reloadData];
});
}];
});

}
//MARK:- Fetch more movies with callback
-(void) fetchOtherMovies: (int* ) page completion:(void(^)(Movie* movie, NSURLResponse *response))callback {
    
NSString *firstUrlString = @"https://api.themoviedb.org/3/discover/movie?api_key=fea6a69ff7391818240b67fa3bb83786&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=";
    int *pageNumber = page;
    
NSString *string = [NSString stringWithFormat:@"%@ %i ", firstUrlString,pageNumber];
    NSString *urlString;
urlString = [string stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
NSURL *url = [NSURL URLWithString:urlString];
    


[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              
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
NSString *identifier = moviesDict[@"id"];
NSString *poster = moviesDict[@"poster_path"];
NSString *backGroundImg = moviesDict[@"backdrop_path"];
Movie *movie = Movie.new;
    
movie.poster_path = poster;
movie.title = title;
movie.identifier = identifier;
movie.backdrop_path = backGroundImg;
    
   
[movies addObject:movie];

  
callback(movie,response);
}


}] resume];
    
}


//-MARK: CollectionViewDelegate Functions
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     
    
    return self.movies.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomMovieCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    Movie *movie = self.movies[indexPath.row];
    cell.movieLabel.text = movie.title;
    cell.identifier = movie.identifier;
    

    NSString *str = @"https://image.tmdb.org/t/p/w185";
        str = [str stringByAppendingString:movie.poster_path];
    [cell.movieImage sd_setImageWithURL:[NSURL URLWithString: str ]];
   
  
    

   
    return cell;
}

//-MARK: PresentViewController, fetchMovieInfo
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *movie = self.movies[indexPath.row];
    InfoViewController *infoViewController;
    infoViewController = InfoViewController.new;
     
    [self fetchMovieInfo:movie.identifier completion:^(MovieInfoModel *movieInfo, NSURLResponse *resp) {
    infoViewController.movieInfo = movieInfo;
   
        
    }];
    
    infoViewController.movie = movie;
    
       
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController: infoViewController];
    
     
    [self.navigationController presentViewController: nav animated:YES completion:nil];
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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

//-MARK: CollectionViewInit & LayoutCode
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
