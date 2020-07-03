//
//  ViewController.m
//  4-队列插队
//
//  Created by luokan on 2020/7/2.
//  Copyright © 2020 金角大王. All rights reserved.
//
//
//  线程lineOne 执行任务期间，让lineTwo任务执行后，再执行剩下的lineOne任务。

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t line1;

@property (nonatomic,strong) dispatch_queue_t line2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.line1 = dispatch_queue_create("com.kk.line1", NULL);
    self.line2 = dispatch_queue_create("com.kk.line2", NULL);
    
    // 使用dispatch_set_target_queue()实现队列的动态调度管理
    dispatch_set_target_queue(self.line1, self.line2);
    
    for (int i = 0; i<10; i++) {
        dispatch_async(self.line1, ^{
            sleep(1);
            NSLog(@"line1 ==== %d\n",i);
        });
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    dispatch_suspend(self.line1);
    
    dispatch_async(self.line2, ^{
        NSLog(@"line2 ====== 插队了\n");
        dispatch_resume(self.line1);
    });
    
}


@end
