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
    
    [self test04];
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


@end
