//
//  ZoomSegue.m
//  ZoomTrasition
//
//  Created by Joseph Lin on 6/21/13.
//  Copyright (c) 2013 Joseph Lin. All rights reserved.
//

#import "ZoomSegue.h"
#import "AppDelegate.h"
#import "ParentViewController.h"
#import "ChildViewController.h"



@implementation ZoomSegue

- (void)perform
{
    ParentViewController *parent = self.sourceViewController;
    ChildViewController *child = self.destinationViewController;
    
    CGRect fromFrame = [parent.imageView.superview convertRect:parent.imageView.frame toView:parent.view];
    
    UIImageView *placeholder = [[UIImageView alloc] initWithFrame:fromFrame];
    placeholder.image = parent.imageView.image;
    placeholder.contentMode = parent.imageView.contentMode;

    [parent.view addSubview:placeholder];
    
    
    
    [parent presentViewController:child animated:NO completion:^{
        
        CGRect childFrame = child.imageView.frame;
        CGRect parentFrame = CGRectOffset(childFrame, child.view.frame.origin.x - parent.view.frame.origin.x, child.view.frame.origin.y - parent.view.frame.origin.y);
        
        [parent dismissViewControllerAnimated:NO completion:^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                placeholder.frame = parentFrame;
                
            } completion:^(BOOL finished) {
                
                child.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                [parent presentViewController:child animated:YES completion:^{
                    
                    [placeholder removeFromSuperview];

                }];
                
                
            }];
            
            
            
            
        }];
    }];
}


@end
