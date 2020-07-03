//
//  ViewController.m
//  6-NSOperation
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "JJOperation1.h"

// 位移枚举
typedef NS_OPTIONS(NSUInteger, JJStyleType) {
    JJStyle1 = 1 << 0,
    JJStyle2 = 1 << 1,
    JJStyle3 = 1 << 2,
};

@interface ViewController ()

@property (nonatomic,strong) NSOperationQueue *queue;

@property (nonatomic,assign) JJStyleType style;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.style = JJStyle1|JJStyle3;
    
    
    if(self.style & JJStyle1){
        NSLog(@"有样式1\n");
    }
    
    if(self.style & JJStyle2){
        NSLog(@"有样式2\n");
    }
    
    if(self.style & JJStyle3){
        NSLog(@"有样式3\n");
    }
    
    
//    [self test01];
//    [self test02];
//    [self test03];
//    [self test04];
//    [self test05];
//    [self test06];
    [self test07];
//    [self test08];
    
}

#pragma mark -
#pragma mark 1. NSInvocationOperation
-(void) test01{
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doWork) object:nil];
    [op1 start];
}

#pragma mark -
#pragma mark 2. NSBlockOperation
-(void) test02{
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务2~~~~~%@\n",[NSThread currentThread]);
    }];
    
    [op2 start];
}

// 追加任务  - 追加的任务是在子线程中执行
// 一个operation中的任务数量>1  会开子线程并发处理任务，不一定是子线程，有可能是主线程
-(void) test03{
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务2~~~~~%@\n",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
       NSLog(@"任务3~~~~~%@\n",[NSThread currentThread]);
    }];
    
    [op2 start];
    
}

-(void) doWork{
    NSLog(@"任务1~~~~~%@\n",[NSThread currentThread]);
}

#pragma mark -
#pragma mark 3. 队列(主队列 & 非主队列)
-(void)test04{
    // 创建一个队列
    self.queue = [NSOperationQueue new];
    
    //
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doWork) object:nil];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务2~~~~~%@\n",[NSThread currentThread]);
    }];
    
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
}


#pragma mark -
#pragma mark  4. 操作依赖
-(void) test05{
    
    // 创建一个队列
    self.queue = [NSOperationQueue new];
    
    //
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doWork) object:nil];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务2~~~~~%@\n",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务3~~~~~%@\n",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务4~~~~~%@\n",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务5~~~~~%@\n",[NSThread currentThread]);
    }];
    
    [op1 addDependency:op2];
    [op2 addDependency:op3];
    [op3 addDependency:op4];
    [op4 addDependency:op5];
    
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
    [self.queue addOperation:op3];
    [self.queue addOperation:op4];
    [self.queue addOperation:op5];
    
    // 输出  5 4 3 2 1
    
}

#pragma mark -
#pragma mark 5. 自定义Operation
-(void) test06{
    
    self.queue = [NSOperationQueue new];
    
    JJOperation1 *op1 = [JJOperation1 new];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
       NSLog(@"任务2~~~~~%@\n",[NSThread currentThread]);
    }];
    
    
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
    
}

#pragma mark -
#pragma mark 6. 队列的暂停 恢复 取消  最大并发  操作依赖
-(void)test07{
    
    // 默认是并发队列
    self.queue = [[NSOperationQueue alloc] init];
    
    // 设置最大并发数(同时间最多多少个任务)
    self.queue.maxConcurrentOperationCount = 2;
    
    // 添加任务
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------1\n");
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------2\n");
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------3\n");
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------4\n");
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------5\n");
    }];
    
    NSBlockOperation *op6 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"任务-------6\n");
    }];
    
    
    op1.completionBlock = ^{
      
        NSLog(@"电影1----下载完成了\n");
    };
    
    // 备注： 可以跨队列依赖
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
    [self.queue addOperation:op3];
    [self.queue addOperation:op4]; 
    [self.queue addOperation:op5];
    [self.queue addOperation:op6];
    
    
//    [self.queue setSuspended:YES]; // 暂停
    
//    [self.queue setSuspended:NO]; // 继续执行
    
//    [self.queue cancelAllOperations]; //取消
    
}

#pragma mark -
#pragma mark 自定义Operation 状态管理
// 如果是自定义的任务  在处理暂停 和 恢复的时候 上面不太一样
-(void) test08{

    self.queue = [[NSOperationQueue alloc] init];
    
    JJOperation1 *op1 = [JJOperation1 new];
    
    [self.queue addOperation:op1];
    
    [self.queue setSuspended:needPasuse];
    
}


static BOOL needPasuse = YES;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    needPasuse = !needPasuse;
    [self.queue setSuspended:needPasuse];
}

@end
