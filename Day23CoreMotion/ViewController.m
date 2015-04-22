//
//  ViewController.m
//  Day23CoreMotion
//
//  Created by tarena on 15-4-12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myBall;
@property (nonatomic, strong)CMMotionManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.manager = [[CMMotionManager alloc]init];
    //设置更新频率
    
    
    [self.manager setAccelerometerUpdateInterval:1.0/60];
    //开始更新
    [self.manager startAccelerometerUpdates];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(getInfo) userInfo:nil repeats:YES];
}

-(void)getInfo{
    CMAcceleration acc = self.manager.accelerometerData.acceleration;
    self.myBall.center = CGPointMake(self.myBall.center.x+acc.x, self.myBall.center.y-acc.y);
    
//    NSLog(@"x=%lf y=%lf z=%lf",acc.x,acc.y,acc.z);
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"开始摇了");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"摇完了");
}
-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"以外中断了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
