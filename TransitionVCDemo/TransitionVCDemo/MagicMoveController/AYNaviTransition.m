//
//  AYNaviTransition.m
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#import "AYNaviTransition.h"
#import "AYMoveOneVC.h"
#import "AYMoveTwoVC.h"
#import "AYBeautifulImageCell.h"
@interface AYNaviTransition()

@property (nonatomic, assign) AnimationType animationType;

@end

@implementation AYNaviTransition

- (instancetype)initWithAnimationType:(AnimationType)animationType {
    self = [super init];
    if (self) {
        _animationType = animationType;
    }
    return self;
}

+ (instancetype)naviTransitionWithAnimationType:(AnimationType)animationType {
    return [[AYNaviTransition alloc] initWithAnimationType:animationType];
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_animationType) {
        case AnimationPushType:
            [self doPushTransitionAnimaiton:transitionContext];
            break;
        case AnimationPopType:
            [self doPopTransitionAnimation:transitionContext];
            break;
        default:
            break;
    }
}

#pragma mark - 自定义实现pop 和 push 动画方法
/*
    push transition animation
 */
- (void)doPushTransitionAnimaiton:(id<UIViewControllerContextTransitioning>)transitionContext {
    //1. get from and to viewController
    AYMoveOneVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    AYMoveTwoVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //2. set image to toVC
    AYBeautifulImageCell *cell = (AYBeautifulImageCell *)[fromVC.collectionView cellForItemAtIndexPath:fromVC.clickIndexPath];
    UIImageView *needImageView = cell.imageView;
    UIView *transitionView = [needImageView snapshotViewAfterScreenUpdates:NO]; // 用于动画过渡的view
    UIView *containerView = [transitionContext containerView];
    toVC.bigImageV.image = needImageView.image;
    
    //3. add target view to containerView and config data for toVC and transitionView
    CGRect startFrame = [needImageView convertRect:cell.imageView.bounds toView:containerView];
    transitionView.frame = startFrame;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:transitionView];
    
    toVC.view.alpha = 0;
    toVC.bigImageV.hidden = YES;
    
    //4. do animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         transitionView.frame = [toVC.bigImageV convertRect:toVC.bigImageV.bounds toView:containerView];
                         toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        transitionView.hidden = YES;
        toVC.bigImageV.hidden = NO;
    }];
}

/*
    pop transition animation
 */
- (void)doPopTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //1. get fromVC and toVC
    AYMoveOneVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    AYMoveTwoVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    AYBeautifulImageCell *cell = (AYBeautifulImageCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.clickIndexPath];
    
    //2. get transitionView and config UI display condition
    UIView *contanierView = [transitionContext containerView];
    UIView *transtionView = contanierView.subviews.lastObject;
    [contanierView insertSubview:toVC.view atIndex:0];
    
    transtionView.hidden = NO;
    fromVC.bigImageV.hidden = YES;
    cell.imageView.hidden = YES;

    //3. do animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         transtionView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:contanierView];
                         fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        
        BOOL isCancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancel];
        
        if (!isCancel) {
            cell.imageView.hidden = NO;
            [transtionView removeFromSuperview];
        }
        else{
            fromVC.view.alpha = 1;
            fromVC.bigImageV.hidden = NO;
            transtionView.hidden = YES;
        }
    }];
}

@end
