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
    placeholder.clipsToBounds = YES;
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

+ (void)unwind:(UIStoryboardSegue *)segue
{
    ParentViewController *parent = segue.destinationViewController;
    ChildViewController *child = segue.sourceViewController;
    
    CGRect childFrame = child.imageView.frame;
    CGRect parentFrame = CGRectOffset(childFrame, child.view.frame.origin.x - parent.view.frame.origin.x, child.view.frame.origin.y - parent.view.frame.origin.y);
    
    UIImageView *placeholder = [[UIImageView alloc] initWithFrame:parentFrame];
    placeholder.image = parent.imageView.image;
    placeholder.contentMode = parent.imageView.contentMode;
    placeholder.clipsToBounds = YES;
    [parent.view addSubview:placeholder];

    
    
    [parent dismissViewControllerAnimated:YES completion:^{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect fromFrame = [parent.imageView.superview convertRect:parent.imageView.frame toView:parent.view];
            placeholder.frame = fromFrame;

        } completion:^(BOOL finished) {
            
            [placeholder removeFromSuperview];

        }];

    }];
}


@end
