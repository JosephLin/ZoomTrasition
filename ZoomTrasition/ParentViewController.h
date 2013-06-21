//
//  ParentViewController.h
//  ZoomTrasition
//
//  Created by Joseph Lin on 6/21/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ParentViewController : UIViewController

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *imageView;
- (IBAction)unwind:(UIStoryboardSegue *)segue;

@end
