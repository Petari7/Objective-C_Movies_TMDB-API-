//
//  ViewController.h
//  Movies_Project
//
//  Created by Petar Ivic on 02/06/2020.
//  Copyright © 2020 Petar Ivic. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


{


  UICollectionView *_collectionView;
    

 
}
@property (assign) int foo;

@end

