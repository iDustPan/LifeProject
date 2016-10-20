//
//  popAnimator.m
//  frame测试
//
//  Created by 徐攀 on 16/8/26.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "popAnimator.h"

#import "XPJokeViewController.h"
#import "JokeDetailViewController.h"

#import "JokeCell.h"


@implementation popAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    JokeDetailViewController *fromViewController = (JokeDetailViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    XPJokeViewController *toViewController = (XPJokeViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the image view
    UIView *imageSnapshot = [fromViewController.picView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.picView.frame fromView:fromViewController.picView.superview];
    fromViewController.picView.hidden = YES;
    
    // Get the cell we'll animate to
    JokeCell *cell = [toViewController tableViewCellForModel:fromViewController.jokeModel];
    cell.imgView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromViewController.view.alpha = 0.0;
        
        // Move the image view
        imageSnapshot.frame = [containerView convertRect:cell.imgView.frame fromView:cell.imgView.superview];
    } completion:^(BOOL finished) {
        // Clean up
        [imageSnapshot removeFromSuperview];
        fromViewController.picView.hidden = NO;
        cell.imgView.hidden = NO;
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

@end
