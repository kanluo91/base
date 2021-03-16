//
//  ViewController.m
//  20-KVO
//
//  Created by luokan on 2021/3/14.
//

#import "ViewController.h"
#import "Persion.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic,strong) Persion *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.p = [Persion new];
    self.p.name = @"金角大王";
    NSLog(@"添加之前 类对象 ====  %@",object_getClass(self.p));
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"添加之后 类对象 ====  %@",object_getClass(self.p));
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}


@end
