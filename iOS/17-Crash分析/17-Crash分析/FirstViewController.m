//
//  FirstViewController.m
//  17-Crash分析
//
//  Created by luokan on 2021/3/13.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self crash01];
    [self crash02];
    
//    SecondViewController *second = [SecondViewController new];
//    [self.navigationController pushViewController:second animated:YES];
}


#pragma mark -
#pragma mark 崩溃1： 角标越界
-(void) crash01{
    
    NSArray *array  = [NSArray arrayWithObjects:@"1",@"2",nil];
    
    [array objectAtIndex:4];
    
}

#pragma mark -
#pragma mark 崩溃2： signal 错误 内存重复释放
-(void) crash02{
    
    void *signal = malloc(1024);
    free(signal);
    free(signal);
    
}

@end
