//
//  RootViewController.m
//  20-KVO
//
//  Created by luokan on 2021/3/14.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "Persion.h"
#import <objc/runtime.h>
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Persion *p =  [Persion new
     ];
    
    NSLog(@"返回之后 = %@\n",object_getClass(p));
    
    
    ViewController *viewController = [ViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
