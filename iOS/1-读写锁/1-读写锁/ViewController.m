//
//  ViewController.m
//  1-读写锁
//
//  Created by luokan on 2020/6/30.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t myQueue;

@property (nonatomic,assign) pthread_rwlock_t lock;

@property (nonatomic,assign) int books;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myQueue = dispatch_queue_create("读写锁xxx", DISPATCH_QUEUE_CONCURRENT);
    
    pthread_rwlock_init(&_lock, NULL);
    
}


#pragma mark -
#pragma mark 读写锁-dispatch_barrier_async
/// 读者借书
-(void) reader01{
    
    dispatch_async(self.myQueue, ^{
        NSLog(@"读者借书: %d\n",self.books);
    });
    
}

/// 作者写书
-(void) writer01{
    
    dispatch_barrier_async(self.myQueue, ^{
        self.books++;
        NSLog(@"作者写书: %d\n",self.books);
    });
}


-(void) test01{
    for (int i = 0; i<10; i++) {
        [self reader01];
    }
    
    
    for (int i = 0; i<5; i++) {
        [self writer01];
    }
}


#pragma mark -
#pragma mark 读写锁2 -  pthread_rwlock
-(void)read02{
    pthread_rwlock_rdlock(&_lock);  // 读加锁
    NSLog(@"读: %d\n",self.books);
    pthread_rwlock_unlock(&_lock);
}

-(void) write02{
    
    pthread_rwlock_wrlock(&_lock); // 写加锁
    sleep(2);
    self.books++;
    NSLog(@"写: %d\n",self.books);
    pthread_rwlock_unlock(&_lock);
}

-(void) test02{
    
    for (int i = 0; i<5; i++) {
        [NSThread detachNewThreadWithBlock:^{
            [self write02];
        }];
     }
    
    for (int i = 0; i<20; i++) {
        [NSThread detachNewThreadWithBlock:^{
               [self read02];
           }];
    }
}

-(void)dealloc{
    
    // 释放锁
    pthread_rwlock_destroy(&_lock);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self test02];
    
}

@end
