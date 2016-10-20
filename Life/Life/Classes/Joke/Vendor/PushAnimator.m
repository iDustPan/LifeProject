//
//  PushAnimator.m
//  frame测试
//
//  Created by 徐攀 on 16/8/26.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "PushAnimator.h"
#import "XPJokeViewController.h"
#import "JokeDetailViewController.h"
#import "JokeCell.h"



@implementation PushAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    XPJokeViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JokeDetailViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    UIView *fromView;
    UIView *toView;
    
    if ([self respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else{
        fromView = fromVC.view;
        toView = toVC.view;
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //  取得被选中的cell
    JokeCell *cell = (JokeCell *)[fromVC.jokeTableView cellForRowAtIndexPath:[fromVC.jokeTableView indexPathsForSelectedRows][0]];
    
    UIView *cellImageSnapshot = [cell.imgView snapshotViewAfterScreenUpdates:NO];
    
    cellImageSnapshot.frame = [container convertRect:cell.imgView.frame fromView:cell.imgView.superview];
    
    cell.imgView.hidden = YES;
    
    toView.frame = [transitionContext finalFrameForViewController:toVC];
    toView.alpha = 0;
    toVC.picView.hidden = YES;
    
    [container addSubview:toVC.view];
    [container addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        
        toView.alpha = 1;
        CGRect frame = [container convertRect:toVC.picView.frame fromView:toVC.picView.superview];
        cellImageSnapshot.frame = frame;
        
    } completion:^(BOOL finished) {
        toVC.picView.hidden = NO;
        cell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

@end
