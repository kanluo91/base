//
//  ViewController.m
//  22-Frame&Bounds
//
//  Created by luokan on 2021/3/15.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *redView;

@property (nonatomic,strong) UIView *yelloView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.yelloView = [UIView new];
    self.yelloView.frame = CGRectMake(100, 100, 200, 200);
    self.yelloView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yelloView];
    
    self.redView = [UIView new];
    self.redView.bounds = CGRectMake(0, 0, 50, 50);
    self.redView.backgroundColor = [UIColor redColor];
    [self.yelloView addSubview:self.redView];
    
    [[NSRunLoop currentRunLoop] run];
    [NSRunLoop currentRunLoop] runUntilDate:<#(nonnull NSDate *)#>
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.yelloView.bounds = CGRectMake(20, 20, 200, 200);
}

@end
