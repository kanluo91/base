//
//  ViewController.m
//  2-死锁问题
//
//  Created by luokan on 2020/7/2.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t serialQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serialQueue = dispatch_queue_create("com.kk.luo", DISPATCH_QUEUE_SERIAL);
    
//    [self test01];
//    [self test02];
//    [self test03];
//    [self test04];
    
//    [self interview01];
//    [self interview02];
//    [self interview03];
//    [self interview04];
//    [self interview05];
}

-(void) test04{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1------------");
        [self performSelector:@selector(commonMethod) withObject:nil afterDelay:1];
        NSLog(@"3------------");
    });
}

-(void) test03{
    
    // 因为并发队列  是可以并发执行的
    NSLog(@"1------------\n");
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
       NSLog(@"2------------\n");
        
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"3------------\n");
        });
        
        NSLog(@"4------------\n");
        
    });
    
    NSLog(@"5------------\n");
}


-(void) test02{
    
    dispatch_async(self.serialQueue, ^{
        [self commonMethod];
    });
}


-(void) test01{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self commonMethod];
    });
}

-(void) commonMethod{
    NSLog(@"执行到这了----------\n");
}



// dispatch_sync和dispatch_async用来控制是否要开启新的线程

/**
 队列的类型，决定了任务的执行方式（并发、串行）
 1.并发队列
 2.串行队列
 3.主队列（也是一个串行队列）
 */

- (void)interview01
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
    
    // dispatch_sync立马在当前线程同步执行任务
}

- (void)interview02
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
    
    // dispatch_async不要求立马在当前线程同步执行任务
}

- (void)interview03
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
    
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview04
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue2, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview05
{
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

@end
