//
//  ParentViewController.m
//  ZoomTrasition
//
//  Created by Joseph Lin on 6/21/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import "ParentViewController.h"
#import "ThumbCell.h"
#import "ZoomSegue.h"


@interface ParentViewController ()
@end


@implementation ParentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)unwind:(UIStoryboardSegue *)segue
{
    [ZoomSegue unwind:segue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(ThumbCell *)sender
{
    self.imageView = sender.imageView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThumbCell" forIndexPath:indexPath];
    return cell;
}


@end
