//
//  UIView+Rolling.m
//  PlayerButton
//
//  Created by qq on 2017/4/20.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "UIView+Rolling.h"
#import <objc/runtime.h>


@implementation UIView(Rolling)

//@dynamic rollSpeed;
//@dynamic timerInterval;
//@dynamic rollDegree;

- (void)setRollSpeed:(CGFloat)rollSpeed{
    objc_setAssociatedObject(self, @selector(rollSpeed), @(rollSpeed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)rollSpeed{
    NSNumber* number = objc_getAssociatedObject(self, @selector(rollSpeed));
    if(number == nil){
        number = @(360.0/8);
        
        self.rollSpeed = number.doubleValue;
    }
    return number.doubleValue ;// 旋转角度：8 秒钟旋转 1 周（360°）;
}

- (void)setTimerInterval:(CGFloat)timerInterval{
    objc_setAssociatedObject(self, @selector(timerInterval), @(timerInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)timerInterval{
    NSNumber* number = objc_getAssociatedObject(self, @selector(timerInterval));
    if(number == nil){
        number = @(0.01);
        self.timerInterval = number.doubleValue;
    }
    return number.doubleValue;// 时钟刷新频率，为了显示流畅，建议 30 帧/秒以上
}
- (void)setRollDegree:(CGFloat)rollDegree{
    objc_setAssociatedObject(self, @selector(rollDegree), @(rollDegree), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)rollDegree{
    NSNumber* number = objc_getAssociatedObject(self, @selector(rollDegree));
    if(number == nil){
        number = @(0);
        self.rollDegree=number.doubleValue;
    }
    return number.doubleValue;
}
-(void)setRollTimer:(NSTimer*)timer{
    objc_setAssociatedObject(self, @selector(rollTimer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSTimer*)rollTimer{
    NSTimer * timer=objc_getAssociatedObject(self, @selector(rollTimer));
    return timer;
}

-(void)beginRoll{
    if(self.rollTimer){
        [self.rollTimer invalidate];
    }
    self.rollTimer = [NSTimer timerWithTimeInterval:self.timerInterval target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.rollTimer forMode:NSDefaultRunLoopMode];
}
-(void)stopRoll{
    [self.rollTimer invalidate];
    self.transform = CGAffineTransformIdentity;
    self.rollDegree=0;
}

-(void)pauseRoll{
    [self.rollTimer invalidate];
}

-(void)timerUpdate{
    self.rollDegree += self.rollSpeed*self.timerInterval;
    if(self.rollDegree >= 360){
        self.rollDegree = (int)self.rollDegree % 360;
        self.transform = CGAffineTransformIdentity;
    }
    self.transform = CGAffineTransformRotate(self.transform, self.rollSpeed*self.timerInterval*M_PI/180);
}
@end









