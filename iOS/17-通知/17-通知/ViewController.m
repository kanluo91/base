//
//  ViewController.m
//  17-通知
//
//  Created by luokan on 2021/3/7.
//

#import "ViewController.h"

#define TEST_NOTIFICATION @"dadada"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t globalQ;

@end

@implementation ViewController

- (void)viewDidLoad
 {
    [super viewDidLoad];
      
//     NSLog(@"sizeof  = %ld\n",sizeof(self));
     
     //_globalQ = dispatch_get_global_queue(0, 0);
     
     _globalQ = dispatch_queue_create("hell0", NULL);
     dispatch_async(_globalQ, ^{
         NSLog(@"----1\n");
     });

     
     dispatch_async(_globalQ, ^{
         NSLog(@"----2\n");
     });
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----3\n");
     });
     dispatch_suspend(_globalQ);
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----4\n");
     });
     
  
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----5\n");
     });
     

     
     dispatch_resume(_globalQ);
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----6\n");
     });
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----7\n");
     });
     
     dispatch_async(_globalQ, ^{
         NSLog(@"----8\n");
     });
     
     NSOperationQueue *qu = [NSOperationQueue new];
     qu.operationCount;
     
     qu.suspended = YES;

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil userInfo:nil];
//    });
}

//- (void)handleNotification:(NSNotification *)notification
//{
//    NSLog(@"current thread = %@", [NSThread currentThread]);
//
//    NSLog(@"test notification");
//}

@end
