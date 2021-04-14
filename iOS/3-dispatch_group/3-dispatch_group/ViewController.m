//
//  ViewController.m
//  3-dispatch_group
//
//  Created by luokan on 2020/7/2.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_group_t group;

@property (nonatomic,strong) dispatch_queue_t myConCurrentQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int count = [NSProcessInfo processInfo].activeProcessorCount;
    
    self.group = dispatch_group_create();
    
    self.myConCurrentQueue = dispatch_queue_create("com.kk.luo", DISPATCH_QUEUE_CONCURRENT);
    

    dispatch_group_async(self.group, self.myConCurrentQueue, ^{
        NSLog(@"A--------\n");
    });
    
    
    dispatch_group_async(self.group, self.myConCurrentQueue, ^{
        
        sleep(1);
        NSLog(@"B--------\n");
    });
    
    
    dispatch_group_async(self.group, self.myConCurrentQueue, ^{
        NSLog(@"C--------\n");
    });
    
    
    dispatch_group_notify(self.group, dispatch_get_main_queue(), ^{
        NSLog(@"D--------\n");
    });

}


@end
