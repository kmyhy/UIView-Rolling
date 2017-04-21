//
//  ViewController.m
//  PlayerButton
//
//  Created by qq on 2017/4/20.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Rolling.h"

@interface ViewController (){
    UIImageView* img;
}
@property(nonatomic,strong,readonly)NSTimer* rollTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    img = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 45, 45)];
    
    img.image = [UIImage imageNamed:@"cover-25"];
    
    img.layer.cornerRadius = 22.5;
    
    img.clipsToBounds = YES;
    
    [self.view addSubview:img];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stop:(id)sender {
    [img stopRoll];
}
- (IBAction)pause:(id)sender {
    [img pauseRoll];
}
- (IBAction)begin:(id)sender {
    [img beginRoll];
}

@end
