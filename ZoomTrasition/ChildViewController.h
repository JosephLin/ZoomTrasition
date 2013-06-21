//
//  ChildViewController.h
//  ZoomTrasition
//
//  Created by Joseph Lin on 6/21/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChildViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) void (^didLayout)(UIView *targetView);

@end
