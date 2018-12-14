//
//  AYGestureInteractiveTranstion.h
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureHandler)(void);

NS_ASSUME_NONNULL_BEGIN

@interface AYGestureInteractiveTranstion : UIPercentDrivenInteractiveTransition

+ (instancetype)gestureInteractiveTranstionWithType:(AnimationType)animationTpye
                               withGestureDirection:(TransitionGestureDirection)direction;

- (void)addGestureWithTargetViewController:(__kindof UIViewController *)targetViewController;

@property (nonatomic, copy) GestureHandler gestureConfig;
@property (nonatomic, assign) BOOL isInteracting; //手势交互是否正在进行
@end

NS_ASSUME_NONNULL_END
