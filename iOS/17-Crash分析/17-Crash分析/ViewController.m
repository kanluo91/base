//
//  ViewController.m
//  17-Crash分析
//
//  Created by luokan on 2021/3/13.
//

#import "ViewController.h"
#import "Persion.h"

@interface ViewController ()

@property (nonatomic,strong) Persion *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.p = [Persion new];
    self.p.age = 100;
    
    [self.p addObserver:self
             forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.p.age = 200;
}

-(void) crash01{
    
    
}


@end
