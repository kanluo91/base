//
//  ViewController.m
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "ViewController.h"
#import "JJTools.h"
#import "JJTestInstance.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JJTools *tool1 = [JJTools new];
    JJTools *tool2 = [JJTools sharedInstance];
    
    // release -1
    // retain  +1
    [tool1 release];
    [tool2 release];
    
    JJTools *tool3 = [tool1 copy];
    JJTools *tool4 = [tool2 mutableCopy];
    
    NSLog(@"实例1 =  %p\n",tool1);
    NSLog(@"实例2 =  %p\n",tool2);
    NSLog(@"实例3 =  %p\n",tool3);
    NSLog(@"实例4 =  %p\n",tool4);
    
    

    [[JJTestInstance sharedTestInstance] haha];
    [[JJTestInstance new] haha];
}


@end
