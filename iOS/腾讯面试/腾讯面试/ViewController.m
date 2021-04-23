//
//  ViewController.m
//  腾讯面试
//
//  Created by luokan on 2021/3/15.
//

#import "ViewController.h"
#import "Performance.h"

//给你一个整数 x ，如果 x 从左向右和从右向左读都是一样的整数，返回 true ；否则，返回 false 。
//
//例如，121 是true，而 123是false。
//
//要求：
//
//1、时间控制为20分钟内
//
//2、不允许使用字符串操作
//
//3、需要给出自测case


//假设APP有一个Preference类，用于保存用户设置，这个类有一些成员变量，比如字体大小，夜间模式，等等
//
//请为这个类加上KVO机制，让外部使用者能够方便监听类中成员变量的变化，举例来说，外部使用者需要知道APP夜间模式的变化，来做一些换肤相关的事情
//
//
//
//要求：
//
//1、时间限制在40分钟内
//
//2、不允许使用OC提供的NSKeyValueObserving机制
//
//3、需要提供完整的接口和实现，建议考虑后续扩展和可复用性

@interface ViewController ()<PerformanceProtocol>

@property (nonatomic,strong) Performance *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BOOL isSame = [self isSameReverse:-121];
    
    self.p = [Performance new];
    [self.p addUIChangeObserver:self];
}

-(void)performanceUIChange:(id)perfomacne{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.p.font = [UIFont systemFontOfSize:12];
}

-(BOOL) isSameReverse:(int)num{
    if(num < 0) return NO;
    int copyValue = num;
    NSMutableArray *array = [NSMutableArray array];
    while (num) {
        int value = num%10;
        [array addObject:[NSNumber numberWithInt:value]];
        num = num/10;
    }
    
    int sum = 0;
    int len = (int)array.count-1;
    for (int i =0; i<array.count; i++) {
        int mi = pow(10, len);
        sum  += [[array objectAtIndex:i] intValue] * mi;
        len--;
    }
    return sum==copyValue?YES:NO;
}

@end
