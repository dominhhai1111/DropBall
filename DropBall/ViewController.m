//
//  ViewController.m
//  DropBall
//
//  Created by Do Minh Hai on 10/9/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ball;
    NSTimer* timer;
    CGFloat ballRadius;
    CGFloat x, y, vellocityY, accellerateY, maxHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBall];
    [self dropBall];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; //toa do bo vien tren
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}

-(void) addBall
{
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Soccer.png"]];
    ballRadius = 64.0;
    x= mainViewSize.width * 0.5;
    y= ballRadius;
    
    vellocityY = 0.0;
    accellerateY = 5.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height ;
    maxHeight= mainViewSize.height - ballRadius - statusNavigationBarHeight ;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

-(void) dropBall
{
    vellocityY+= accellerateY;
    y += vellocityY;
    if (y> maxHeight) {
        vellocityY = -vellocityY*0.8;
        y= maxHeight;
    }
    ball.center = CGPointMake(x, y);
}
@end
