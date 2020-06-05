//
//  MoviesModel.h
//  Movies_Project
//
//  Created by Petar Ivic on 03/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Movie : NSObject

@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *identifier;
@property(strong,nonatomic) NSString *poster_path;
@property(strong,nonatomic) NSString *backdrop_path;



@end


