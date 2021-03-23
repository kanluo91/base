//
//  ViewController.m
//  32-动画暂停
//
//  Created by luokan on 2021/3/22.
//

#import "ViewController.h"
#import <CoreFoundation/CoreFoundation.h>

@interface ViewController ()

@property (nonatomic,strong) UIView *moveView;

@end

@implementation ViewController

static bool isStop = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moveView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.moveView];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position";

    anim.fromValue = [NSValue valueWithCGPoint:CGPointZero];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(500, 500)];
    anim.duration = 10;
    [self.moveView.layer addAnimation:anim forKey:@"da"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(isStop == NO){
        CFTimeInterval pauseTime = [self.moveView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.moveView.layer.speed = 0;
        self.moveView.layer.timeOffset = pauseTime;
        isStop = YES;
    }else{
        
        CFTimeInterval pauseTime = self.moveView.layer.timeOffset;
        self.moveView.layer.speed =  1.0;
        self.moveView.layer.timeOffset = 0.0;
        self.moveView.layer.beginTime = 0.0;
         CFTimeInterval timeSincePause = [self.moveView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
        self.moveView.layer.beginTime = timeSincePause;

        isStop = NO;
    }

    
}


@end
