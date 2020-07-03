//
//  JJOperation1.m
//  6-NSOperation
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "JJOperation1.h"

@implementation JJOperation1

#pragma mark -
#pragma mark 要执行的任务
-(void)main{
    // 假如有3个耗时操作
    for (int i = 0; i<1000; i++) {
        NSLog(@"任务1 =========%d\n",i);
    }
    
    if(self.isCancelled) return;
    
    for (int i = 0; i<1000; i++) {
        NSLog(@"任务2 =========%d\n",i);
    }
    
    if(self.isCancelled) return;
    
    for (int i = 0; i<1000; i++) {
        NSLog(@"任务3 =========%d\n",i);
    }
}

@end
