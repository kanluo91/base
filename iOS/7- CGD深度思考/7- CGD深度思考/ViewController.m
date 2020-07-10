//
//  ViewController.m
//  7- CGD深度思考
//
//  Created by luokan on 2020/7/10.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t line1;

@property (nonatomic,strong) dispatch_queue_t line2;

@property (nonatomic,strong) dispatch_queue_t line3;

@property (nonatomic,strong) dispatch_queue_t line4;

@property (nonatomic,strong) dispatch_queue_t line5;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1];
    
//    [self test2];
    
    [self test3];
}


// 修改队列的优先级   line1 的优先级 和 backgroundline 一致
-(void) test1{
    
    self.line1 = dispatch_queue_create("com.kk.line1", DISPATCH_QUEUE_SERIAL);
    
    self.line2 = dispatch_queue_create("com.kk.line2", DISPATCH_QUEUE_SERIAL);
    
    // 变更前
    dispatch_async(self.line1, ^{
        NSLog(@"变更前- ------1\n");
    });
    
    dispatch_async(self.line2, ^{
        NSLog(@"变更前- ------2\n");
    });
    
    //  修改 line1 的优先级  降低了line1 的优先级
    dispatch_queue_t backgroundQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_set_target_queue(self.line1, backgroundQueue);
    
    dispatch_async(self.line1, ^{
        NSLog(@"变更后- ------1\n");
    });
    
    dispatch_async(self.line2, ^{
        NSLog(@"变更后- ------2\n");
    });
}


// 修改队列的执行阶层
-(void) test2{
    
     self.line1 = dispatch_queue_create("com.kk.line1", DISPATCH_QUEUE_SERIAL);
     self.line2 = dispatch_queue_create("com.kk.line2", DISPATCH_QUEUE_SERIAL);
     self.line3 = dispatch_queue_create("com.kk.line3", DISPATCH_QUEUE_SERIAL);
     self.line4 = dispatch_queue_create("com.kk.line4", DISPATCH_QUEUE_SERIAL);
     self.line5 = dispatch_queue_create("com.kk.line5", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(self.line1, ^{
        printf("任务------------1\n");
    });
    
    dispatch_async(self.line2, ^{
        printf("任务------------2\n");
    });
    
    dispatch_async(self.line3, ^{
        printf("任务------------3\n");
    });
    
    dispatch_async(self.line4, ^{
        printf("任务------------4\n");
    });
    
    dispatch_async(self.line5, ^{
        printf("任务------------5\n");
    });
    NSLog(@"设置阶层之后----------\n");
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.kk.serialqueue", DISPATCH_QUEUE_SERIAL);

    dispatch_set_target_queue(self.line1, serialQueue);
    dispatch_set_target_queue(self.line2, serialQueue);
    dispatch_set_target_queue(self.line3, serialQueue);
    dispatch_set_target_queue(self.line4, serialQueue);
    dispatch_set_target_queue(self.line5, serialQueue);
    
    dispatch_async(self.line1, ^{
        printf("任务------------1\n");
    });
    
    dispatch_async(self.line2, ^{
        printf("任务------------2\n");
    });
    
    dispatch_async(self.line3, ^{
        printf("任务------------3\n");
    });
    
    dispatch_async(self.line4, ^{
        printf("任务------------4\n");
    });
    
    dispatch_async(self.line5, ^{
        printf("任务------------5\n");
    });
}


// 队列插队
-(void) test3{
    
    
    self.line1 = dispatch_queue_create("com.kk.line1", DISPATCH_QUEUE_SERIAL);
    
    self.line2 = dispatch_queue_create("com.kk.line2", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 50; i++) {
        
        dispatch_async(self.line1, ^{
            sleep(1);
            printf("任务 ----- %d\n",i);
        });
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    dispatch_set_target_queue(self.line1, self.line2);
    
    dispatch_suspend(self.line1);
    
    dispatch_async(self.line2, ^{
        printf("插队--------------哈哈\n");
    });
        
    dispatch_resume(self.line1);
    
    
}

@end
