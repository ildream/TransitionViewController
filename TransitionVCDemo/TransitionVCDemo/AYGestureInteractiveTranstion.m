//
//  AYGestureInteractiveTranstion.m
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#import "AYGestureInteractiveTranstion.h"

@interface AYGestureInteractiveTranstion()
@property (nonatomic, assign) AnimationType animationType;
@property (nonatomic, assign) TransitionGestureDirection direction;
@property (nonatomic, strong) UIViewController *targetVC;
@end

@implementation AYGestureInteractiveTranstion

- (instancetype)initWithAnimationType:(AnimationType)type withDirection:(TransitionGestureDirection)direction
{
    self = [super init];
    if (self) {
        _animationType = type;
        _direction = direction;
    }
    return self;
}

+ (instancetype)gestureInteractiveTranstionWithType:(AnimationType)animationTpye
                               withGestureDirection:(TransitionGestureDirection)direction
{
    return [[AYGestureInteractiveTranstion alloc] initWithAnimationType:animationTpye withDirection:direction];
}

- (void)addGestureWithTargetViewController:(__kindof UIViewController *)targetViewController {
    _targetVC = targetViewController;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
    [targetViewController.view addGestureRecognizer:panGesture];
}

- (void)panGestureHandler:(UIPanGestureRecognizer *)gesture {
    
    CGPoint offsetP = [gesture translationInView:gesture.view];
    CGFloat percent = 0;
    
    switch (_direction) {
        case TransitionGestureDirectionLeft:
        {
            percent = -offsetP.x/gesture.view.bounds.size.width;
        }
            break;
        case TransitionGestureDirectionRight:
        {
             percent = offsetP.x/gesture.view.bounds.size.width;
        }
            break;
        case TransitionGestureDirectionUp:
        {
             percent = -offsetP.y/gesture.view.bounds.size.height;
        }
            break;
        case TransitionGestureDirectionDown:
        {
            percent = offsetP.y/gesture.view.bounds.size.height;
        }
            break;
            
        default:
            break;
    }
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            
        }
            break;
        default:
            break;
    }
    
}

@end
