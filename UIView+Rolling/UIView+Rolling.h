//
//  UIView+Rolling.h
//  PlayerButton
//
//  Created by qq on 2017/4/20.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Rolling)

@property(nonatomic,assign)CGFloat rollSpeed;// 旋转角度：8 秒钟旋转 1 周（360°）
@property(nonatomic,assign)CGFloat timerInterval;// 时钟刷新频率，为了显示流畅，建议 30 帧/秒以上
@property(nonatomic,assign)CGFloat rollDegree;// 统计旋转总角度
@property(nonatomic,strong,readonly)NSTimer* rollTimer;// 定时器

-(void)beginRoll;
-(void)stopRoll;

-(void)pauseRoll;
@end
