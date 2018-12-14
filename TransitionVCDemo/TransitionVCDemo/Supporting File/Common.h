//
//  Common.h
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define kWidth UIScreen.mainScreen.bounds.size.width
#define kHeight UIScreen.mainScreen.bounds.size.height

typedef enum : NSUInteger {
    AnimationPushType,
    AnimationPopType,
    AnimationPresentType,
    AnimationDismissType
} AnimationType;

typedef NS_ENUM(NSUInteger, TransitionGestureDirection) {
    TransitionGestureDirectionLeft = 0,
    TransitionGestureDirectionRight,
    TransitionGestureDirectionUp,
    TransitionGestureDirectionDown
};

#endif /* Common_h */
