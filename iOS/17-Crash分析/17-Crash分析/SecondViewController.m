//
//  SecondViewController.m
//  17-Crash分析
//
//  Created by luokan on 2021/3/13.
//

#import "SecondViewController.h"
#import "Persion.h"

@interface SecondViewController ()
@property (nonatomic,strong) Persion *p;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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

-(void)dealloc{
    
}
@end
