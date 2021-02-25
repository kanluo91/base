//
//  ViewController.m
//  Hook
//
//  Created by luokan on 2021/2/25.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Persion.h"

@interface ViewController ()

@property (nonatomic,strong) Persion *p;

@end

@implementation ViewController

void run3(id self,SEL _cmd,int num){
    
    NSLog(@"替换后的方法run3： %d",num);
}


-(void) run2:(int)num{
    
    NSLog(@"替换后的方法run2： %d",num);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p = [Persion new];
    self.p.name = @"金角大王";
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    Method m1 = class_getInstanceMethod([Persion class], @selector(run:));
    
    Method m2 = class_getInstanceMethod([self class], @selector(run2:));
    
    method_exchangeImplementations(m1, m2);
    
    [self.p run:101];
    
}


@end
