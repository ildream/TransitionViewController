//
//  AYMoveTwoVC.m
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#import "AYMoveTwoVC.h"
#import "AYNaviTransition.h"

static const int kMargin = 20;

@interface AYMoveTwoVC ()

@end

@implementation AYMoveTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"big beautiful girl";
    
    [self.view addSubview:self.bgView];
    
    self.bigImageV = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin, (kHeight - kWidth + 2*kMargin)/2, kWidth-2*kMargin, kWidth-2*kMargin)];
    self.bigImageV.contentMode = UIViewContentModeScaleToFill;
    [self.bgView.contentView addSubview:self.bigImageV];
}

- (UIVisualEffectView *)bgView {
    if (_bgView == nil) {
        UIVisualEffect *effectView = [UIVisualEffect new];
        _bgView = [[UIVisualEffectView alloc] initWithEffect:effectView];
        _bgView.frame = UIScreen.mainScreen.bounds;
        //_bgView.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    }
    return _bgView;
}

#pragma mark - UINavigationControllerDelegate

//for change system transition animation
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    return [AYNaviTransition naviTransitionWithAnimationType:operation == UINavigationControllerOperationPush ? AnimationPushType : AnimationPopType];
}

// for gesture interaction
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if (self.view) {
        NSLog(@"----------->");
    }
    return nil;
}

@end
